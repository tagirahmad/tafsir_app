part of 'font_size_bloc.dart';

abstract class FontSizeEvent extends Equatable {
  const FontSizeEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends FontSizeEvent {}

class FontSizeFontSuccess extends FontSizeEvent {}

class FontSizeChanged extends FontSizeEvent {
  final double fontSize;

  const FontSizeChanged(this.fontSize);

  @override
  List<Object> get props => [fontSize];
}
