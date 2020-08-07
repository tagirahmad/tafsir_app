part of 'bookmark_bloc.dart';

abstract class BookmarkState extends Equatable {
  // final String lastChapter;
  // final String text;
  // final String title;

  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {
  BookmarkInitial() : super();

  @override
  List<Object> get props => [];
}

class BookmarkLoadInProgress extends BookmarkState {}

class BookmarkSetSuccess extends BookmarkState {}

class BookmarkNoContent extends BookmarkState {}
// ignore: must_be_immutable
class BookmarkLoadSuccess extends BookmarkState {
  final String lastChapter;
  final String text;
  final String title;

  const BookmarkLoadSuccess({this.lastChapter, this.text, this.title});

  @override
  List<Object> get props => [lastChapter, text, title];

  @override
  String toString() =>
      'BookmarkLoadSuccess { lastChapter: $lastChapter, text: $text, title: $title }';
}

class BookmarkLoadFailure extends BookmarkState {}
