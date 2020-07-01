import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tafsir_albaqara/repository/content_repository.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  @override
  ContentState get initialState => ContentLoadInProgress(null);

  @override
  Stream<ContentState> mapEventToState(
    ContentEvent event
  ) async* {
    if (event is AppLaunched) {
      yield* _getContent();
    }
  }

  Stream<ContentState> _getContent() async* {
    dynamic content = await ContentRepository.getContents();
    yield ContentLoadSuccess(content);
  }
}
