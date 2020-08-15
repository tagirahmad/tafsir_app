import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:tafsir_albaqara/models/chapter.dart';

IconButton resolveBookmarkButton(BookmarkBloc bookmarkBloc, Chapter chapter) {
  return IconButton(
      icon: const Icon(Icons.bookmark),
      onPressed: () {
        bookmarkBloc.add(BookmarkChanged(chapter: chapter));
      });
}
