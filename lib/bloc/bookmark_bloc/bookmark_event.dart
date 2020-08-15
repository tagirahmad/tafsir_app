part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => <Object>[];
}

class AppStarts extends BookmarkEvent {}

class BookmarkSuccess extends BookmarkEvent {}

class BookmarkChanged extends BookmarkEvent {
  const BookmarkChanged({@required this.chapter});

  final Chapter chapter;

  @override
  List<Object> get props => <Object>[chapter];
}
