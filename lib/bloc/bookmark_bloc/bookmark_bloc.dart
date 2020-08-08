import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:tafsir_albaqara/repository/bookmark_repository.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  @override
  BookmarkState get initialState => BookmarkInitial();

  @override
  Stream<BookmarkState> mapEventToState(
    BookmarkEvent event,
  ) async* {
    if (event is BookmarkChanged) {
      yield* _mapBookmarkChanged(event.text, event.lastChapter, event.title);
      yield* _getBookmarkFromStore();
    } else if (event is AppStarts) {
      yield* _getBookmarkFromStore();
    }
  }

  Stream<BookmarkState> _mapBookmarkChanged(
      String text, String lastChapter, String title) async* {
    // if (state is BookmarkInitial || state is BookmarkSetSuccess || state is BookmarkNoContent) {
    try {
      BookmarkRepository.setLastPos(text, title, lastChapter);
      yield BookmarkSetSuccess();
    } catch (_) {
      yield BookmarkLoadFailure();
    }
    // }
  }

  Stream<BookmarkState> _getBookmarkFromStore() async* {
    if (state is BookmarkSetSuccess || state is BookmarkInitial) {
      try {
        Map<String, dynamic> store = await BookmarkRepository.getLastPos();

        if (store['lastChapter'] != null) {
          yield BookmarkLoadSuccess(
              lastChapter: store['lastChapter'],
              text: store['text'],
              title: store['title']);
        } else {
          yield BookmarkNoContent();
        }
      } catch (_) {
        yield BookmarkNoContent();
      }
    }
  }
}
