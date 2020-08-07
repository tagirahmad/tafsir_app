import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafsir_albaqara/bloc/content_bloc/content_bloc.dart';
import 'package:tafsir_albaqara/ui/ChapterCard.dart';
import 'package:tafsir_albaqara/ui/DynamicThemeIconButton.dart';
import 'package:tafsir_albaqara/ui/SettingsIconButton.dart';

class ListOfContent extends StatelessWidget {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/content/content.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Список глав'),
          actions: <Widget>[DynamicThemeIconButton(), SettingsIconButton()],
        ),
        body: Container(
          child:
              // ignore: missing_return
              BlocBuilder<ContentBloc, ContentState>(builder: (context, state) {
            if (state is ContentLoadInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ContentLoadSuccess) {
              return ListView.builder(
                itemCount: state.data.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ChapterCard(
                        chapter: state.data[index]['chapter'],
                        text: state.data[index]['text'],
                        title: state.data[index]['title']
                      )  
                    ],
                  );
                },
              );
            }
          }),
        ));
  }
}
