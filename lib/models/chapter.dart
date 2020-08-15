import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Chapter extends Equatable {
  const Chapter(
      {@required this.text, @required this.title, @required this.chapterName});

  final String text;
  final String title;
  final String chapterName;

  @override
  List<Object> get props => <Object>[text, title, chapterName];
}
