part of 'bookmark_bloc.dart';



abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class AppStarts extends BookmarkEvent {}

class BookmarkSuccess extends BookmarkEvent {}

class BookmarkChanged extends BookmarkEvent {
  final String lastChapter;
  final String text;
  final String title;

  const BookmarkChanged({@required this.lastChapter, @required this.text, @required this.title});

  @override
  List<Object> get props => [lastChapter, text, title];
}
