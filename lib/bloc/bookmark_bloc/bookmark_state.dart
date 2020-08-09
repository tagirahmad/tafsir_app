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
  const BookmarkLoadSuccess({this.lastChapter, this.text, this.title});

  final String lastChapter;
  final String text;
  final String title;

  @override
  List<Object> get props => <Object>[lastChapter, text, title];

  @override
  String toString() =>
      'BookmarkLoadSuccess { lastChapter: $lastChapter, text: $text, title: $title }';
}

class BookmarkLoadFailure extends BookmarkState {}
