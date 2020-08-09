part of 'font_size_bloc.dart';

abstract class FontSizeState extends Equatable {
  const FontSizeState({this.fontSize});

  final double fontSize;

  @override
  List<Object> get props => <Object>[];
}

class FontSizeInitial extends FontSizeState {
  const FontSizeInitial() : super(fontSize: 15);

  @override
  List<Object> get props => <Object>[fontSize];
}

class FontSizeLoadInProgress extends FontSizeState {}

// ignore: must_be_immutable
class FontSizeLoadSuccess extends FontSizeState {
  const FontSizeLoadSuccess({this.fontSize});

  final double fontSize;

  @override
  List<Object> get props => <Object>[fontSize];

  @override
  String toString() => 'FontSizeLoadSuccess { fontSize: $fontSize }';
}

class FontSizeLoadFailure extends FontSizeState {}
