// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tafsir_albaqara/models/chapter.dart';

// Project imports:
import 'package:tafsir_albaqara/repository/bookmark_repository.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc(BookmarkState initialState) : super(initialState);

  BookmarkState get initialState => const BookmarkInitial();

  @override
  Stream<BookmarkState> mapEventToState(
    BookmarkEvent event,
  ) async* {
    if (event is BookmarkChanged) {
      yield* _mapBookmarkChanged(event.chapter);
      yield* _getBookmarkFromStore();
    } else if (event is AppStarts) {
      yield* _getBookmarkFromStore();
    }
  }

  Stream<BookmarkState> _mapBookmarkChanged(Chapter chapter) async* {
    yield BookmarkLoadInProgress();
    try {
      BookmarkLocalRepository()
          .setLastPos(chapter.text, chapter.title, chapter.chapterName);
      yield BookmarkSetSuccess();
    } catch (_) {
      yield BookmarkLoadFailure();
    }
  }

  Stream<BookmarkState> _getBookmarkFromStore() async* {
    if (state is BookmarkSetSuccess || state is BookmarkInitial) {
      try {
        yield BookmarkLoadInProgress();
        final Map<String, dynamic> store =
            await BookmarkLocalRepository().getLastPos();

        if (store['lastChapter'] != null) {
          yield BookmarkLoadSuccess(
              chapter: Chapter(
                  chapterName: store['lastChapter'] as String,
                  title: store['title'] as String,
                  text: store['text'] as String));
        } else {
          yield BookmarkNoContent();
        }
      } catch (_) {
        yield BookmarkLoadFailure();
      }
    }
  }
}
