part of 'content_bloc.dart';

abstract class ContentState extends Equatable {

  final dynamic data;

  const ContentState(this.data) ;
}

class ContentLoadInProgress extends ContentState {
  ContentLoadInProgress(data) : super(data);

  @override
  List<Object> get props => [];
  
}

class ContentLoadSuccess extends ContentState {
  final dynamic data;

  ContentLoadSuccess(this.data) : super(null);

  @override
  List<Object> get props => [data];
  
}
