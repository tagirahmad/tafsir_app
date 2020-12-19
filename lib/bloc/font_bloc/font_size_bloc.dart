// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:tafsir_albaqara/repository/font_repository.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc(FontSizeState initialState) : super(initialState);

  FontSizeState get initialState => const FontSizeInitial();

  @override
  Stream<FontSizeState> mapEventToState(
    FontSizeEvent event,
  ) async* {
    if (event is FontSizeFontSuccess) {
      yield* _mapFontsSizeLoadedToState();
    } else if (event is FontSizeChanged) {
      yield* _mapFontSizeChanged(event.fontSize);
    } else if (event is AppStarted) {
      yield* _getFontSizeFromStore();
    }
  }

  Stream<FontSizeState> _mapFontsSizeLoadedToState() async* {
    try {
      final double fontSize = await FontLocalRepository().getFontSize();
      yield FontSizeLoadSuccess(fontSize: fontSize);
    } catch (_) {
      yield FontSizeLoadFailure();
    }
  }

  Stream<FontSizeState> _mapFontSizeChanged(double fontSize) async* {
    if (state is FontSizeLoadSuccess) {
      FontLocalRepository().setFontSize(fontSize);
      yield FontSizeLoadSuccess(fontSize: fontSize);
    } else if (state is FontSizeInitial) {
      FontLocalRepository().setFontSize(fontSize);
      yield FontSizeLoadSuccess(fontSize: fontSize);
    }
  }

  Stream<FontSizeState> _getFontSizeFromStore() async* {
    try {
      final double fs = await FontLocalRepository().getFontSize();
      yield FontSizeLoadSuccess(fontSize: fs);
    } catch (e) {
      yield FontSizeLoadFailure();
    }
  }
}
