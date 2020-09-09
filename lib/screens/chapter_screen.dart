// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

// Project imports:
import 'package:tafsir_albaqara/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:tafsir_albaqara/components/appbar_actions.dart';
import 'package:tafsir_albaqara/components/bookmark_button.dart';
import 'package:tafsir_albaqara/models/chapter.dart';
import 'package:tafsir_albaqara/statics/styles.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({Key key, @required this.chapter}) : super(key: key);

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    final BookmarkBloc bookmarkBloc = BlocProvider.of<BookmarkBloc>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(
            chapter.chapterName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: appBarTitleFs),
          ),
          actions: appBarActions(AppBarPlace.chapterScreen) +
              <Widget>[resolveBookmarkButton(bookmarkBloc, chapter, context)]),
      body: BlocBuilder<FontSizeBloc, FontSizeState>(
        builder: (BuildContext context, FontSizeState state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Html(
                          data: chapter.title,
                          defaultTextStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: state.fontSize),
                          customTextAlign: (dom.Node node) {
                            return TextAlign.center;
                          },
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20.0,
                  ),
                  Html(
                      data: chapter.text,
                      customTextStyle: (dom.Node node, TextStyle baseStyle) {
                        if (node is dom.Element) {
                          switch (node.localName) {
                            case 'h2':
                              return TextStyle(fontSize: state.fontSize + 10);
                            case 'h3':
                              return TextStyle(fontSize: state.fontSize + 6);
                            case 'h4':
                              return TextStyle(
                                  fontSize: state.fontSize + 3,
                                  fontWeight: FontWeight.bold);
                          }
                        }
                      },
                      defaultTextStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: state.fontSize),
                      customTextAlign: (dom.Node node) {
                        if (node is dom.Element) {
                          switch (node.localName) {
                            case 'h2':
                              return TextAlign.center;
                            case 'h3':
                              return TextAlign.center;
                          }
                        }
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
