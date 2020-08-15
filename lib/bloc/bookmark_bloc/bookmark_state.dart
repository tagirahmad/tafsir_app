part of 'bookmark_bloc.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => <Object>[];
}

class BookmarkInitial extends BookmarkState {
  const BookmarkInitial() : super();

  @override
  List<Object> get props => <Object>[];
}

class BookmarkLoadInProgress extends BookmarkState {}

class BookmarkSetSuccess extends BookmarkState {}

class BookmarkNoContent extends BookmarkState {}

// ignore: must_be_immutable
class BookmarkLoadSuccess extends BookmarkState {
  const BookmarkLoadSuccess({this.chapter});

  final Chapter chapter;

  @override
  List<Object> get props => <Object>[chapter];

  @override
  String toString() =>
      'BookmarkLoadSuccess { lastChapter: ${chapter.chapterName}, text: ${chapter.text}, title: ${chapter.title} }';
}

class BookmarkLoadFailure extends BookmarkState {}
