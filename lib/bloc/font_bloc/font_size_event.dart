part of 'font_size_bloc.dart';

abstract class FontSizeEvent extends Equatable {
  const FontSizeEvent();

  @override
  List<Object> get props => <Object>[];
}

class AppStarted extends FontSizeEvent {}

class FontSizeFontSuccess extends FontSizeEvent {}

class FontSizeChanged extends FontSizeEvent {
  const FontSizeChanged(this.fontSize);
  final double fontSize;

  @override
  List<Object> get props => <Object>[fontSize];
}
