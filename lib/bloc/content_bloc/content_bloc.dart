// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:tafsir_albaqara/repository/content_repository.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  @override
  ContentState get initialState => const ContentLoadInProgress(null);

  @override
  Stream<ContentState> mapEventToState(ContentEvent event) async* {
    if (event is AppLaunched) {
      yield* _getContent();
    }
  }

  Stream<ContentState> _getContent() async* {
    final dynamic content = await ContentRepository.getContents();
    yield ContentLoadSuccess(content);
  }
}
