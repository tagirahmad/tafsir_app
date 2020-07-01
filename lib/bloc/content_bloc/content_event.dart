part of 'content_bloc.dart';

abstract class ContentEvent extends Equatable {
  const ContentEvent();

  @override
  List<Object> get props => [];
}


class AppLaunched extends ContentEvent {}

class ContentLoadedSuccess extends ContentEvent {}