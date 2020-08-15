// Dart imports:
import 'dart:async' show Future;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:tafsir_albaqara/bloc/content_bloc/content_bloc.dart';
import 'package:tafsir_albaqara/components/appbar_actions.dart';
import 'package:tafsir_albaqara/components/chapter_card.dart';
import 'package:tafsir_albaqara/models/chapter.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';
import 'package:tafsir_albaqara/statics/styles.dart';

class ListOfContent extends StatelessWidget {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/content/content.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            GlobalConstants.listOfContents,
            style: TextStyle(fontSize: appBarTitleFs),
          ),
          actions: appBarActions(AppBarPlace.listOfContent),
        ),
        body: Container(
          child:
              // ignore: missing_return
              BlocBuilder<ContentBloc, ContentState>(
                  builder: (BuildContext context, ContentState state) {
            if (state is ContentLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ContentLoadSuccess) {
              return ListView.builder(
                itemCount: state.loadedData.length as int ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ChapterCard(
                          chapter: Chapter(
                              text: state.loadedData[index]['text'] as String,
                              title: state.loadedData[index]['title'] as String,
                              chapterName:
                                  state.loadedData[index]['chapter'] as String))
                    ],
                  );
                },
              );
            } else {
              return Container(
                height: 0,
                width: 0,
              );
            }
          }),
        ));
  }
}
