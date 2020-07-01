part of 'font_size_bloc.dart';

abstract class FontSizeState extends Equatable {
  final double fontSize;
  const FontSizeState({this.fontSize});

  @override
  List<Object> get props => [];
}

class FontSizeInitial extends FontSizeState {
  FontSizeInitial() : super(fontSize: 15);

  @override
  List<Object> get props => [fontSize];
}

class FontSizeLoadInProgress extends FontSizeState {}

// ignore: must_be_immutable
class FontSizeLoadSuccess extends FontSizeState {
  final double fontSize;

  const FontSizeLoadSuccess({this.fontSize});
  // const FontSizeLoadISuccess([this.fontSize = const []]);

  @override
  List<Object> get props => [fontSize];

  @override
  String toString() => 'FontSizeLoadSuccess { fontSize: $fontSize }';
}


class FontSizeLoadFailure extends FontSizeState {}