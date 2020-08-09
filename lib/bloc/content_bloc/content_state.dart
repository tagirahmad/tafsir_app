part of 'content_bloc.dart';

abstract class ContentState extends Equatable {
  const ContentState(this.data);
  final dynamic data;
}

class ContentLoadInProgress extends ContentState {
  const ContentLoadInProgress(dynamic data) : super(data);

  @override
  List<Object> get props => <Object>[];
}

class ContentLoadSuccess extends ContentState {
  const ContentLoadSuccess(this.loadedData) : super(null);
  final dynamic loadedData;

  @override
  List<Object> get props => <Object>[loadedData];
}
