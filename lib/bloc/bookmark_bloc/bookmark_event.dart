part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => <Object>[];
}

class AppStarts extends BookmarkEvent {}

class BookmarkSuccess extends BookmarkEvent {}

class BookmarkChanged extends BookmarkEvent {
  const BookmarkChanged(
      {@required this.lastChapter, @required this.text, @required this.title});

  final String lastChapter;
  final String text;
  final String title;

  @override
  List<Object> get props => <Object>[lastChapter, text, title];
}
