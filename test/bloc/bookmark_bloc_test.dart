import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tafsir_albaqara/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:tafsir_albaqara/models/chapter.dart';
import 'package:tafsir_albaqara/repository/bookmark_repository.dart';
import 'package:test/test.dart';

class MockBookmarkBloc extends MockBloc<BookmarkState> implements BookmarkBloc {
  MockBookmarkBloc({this.bookmarkLocalRepository, this.bookmarkInitial})
      : super();

  MockBookmarkLocalRepository bookmarkLocalRepository;
  BookmarkInitial bookmarkInitial;
}

class MockBookmarkLocalRepository extends Mock
    implements BookmarkLocalRepository {}

void main() {
  flutter_test.TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues(<String, dynamic>{});

  group('BookmarkBloc', () {
    BookmarkBloc bookmarkBloc;

    setUp(() {
      bookmarkBloc = BookmarkBloc(const BookmarkInitial());
    });

    tearDown(() {
      bookmarkBloc.close();
    });

    test('initial state of BookmarkBloc is BookmarkInitial()', () {
      expect(bookmarkBloc.state, const BookmarkInitial());
    });

    blocTest<BookmarkBloc, BookmarkState>(
      'FontSizeBloc should yield BookmarkNoContent & BookmarkLoadInProgress when AppStarted and there is no any bookmark',
      build: () {
        final BookmarkBloc bookmarkBloc = BookmarkBloc(const BookmarkInitial());

        return bookmarkBloc;
      },
      act: (BookmarkBloc bloc) => bloc.add(AppStarts()),
      expect: <BookmarkState>[BookmarkLoadInProgress(), BookmarkNoContent()],
    );

    blocTest<MockBookmarkBloc, BookmarkState>(
      'FontSizeBloc should yield BookmarkLoadSuccess when AppStarted and there is a bookmark',
      build: () {
        final MockBookmarkBloc bookmarkBloc = MockBookmarkBloc(
            bookmarkInitial: const BookmarkInitial(),
            bookmarkLocalRepository: MockBookmarkLocalRepository());

        return bookmarkBloc;
      },
      act: (MockBookmarkBloc bloc) => bloc.add(AppStarts()),
      expect: <BookmarkState>[
        BookmarkLoadInProgress(),
        const BookmarkLoadSuccess(
            chapter: Chapter(
                chapterName: 'Chapter name', title: 'title', text: 'text')),
        // const BookmarkLoadSuccess(),
        // BookmarkNoContent()
      ],
    );
  });
}
