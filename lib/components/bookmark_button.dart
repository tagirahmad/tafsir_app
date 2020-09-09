import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:tafsir_albaqara/models/chapter.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';

Builder resolveBookmarkButton(
    BookmarkBloc bookmarkBloc, Chapter chapter, BuildContext context) {
  const SnackBar snackBar = SnackBar(
    content: Text(
      GlobalConstants.lastPosSaved,
      textAlign: TextAlign.center,
    ),
  );

  return Builder(
    builder: (BuildContext context) => IconButton(
        icon: const Icon(Icons.bookmark),
        onPressed: () {
          bookmarkBloc.add(BookmarkChanged(chapter: chapter));
          Scaffold.of(context).showSnackBar(snackBar);
        }),
  );
}
