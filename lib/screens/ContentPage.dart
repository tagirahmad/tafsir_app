import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:tafsir_albaqara/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:tafsir_albaqara/statics/styles.dart';
import 'package:tafsir_albaqara/ui/DynamicThemeIconButton.dart';
import 'package:tafsir_albaqara/ui/FontSizeButton.dart';

class PageContent extends StatelessWidget {
  const PageContent(
      {@required this.text,
      @required this.title,
      @required this.chapter,
      this.lastPos});

  final String text;
  final String title;
  final String chapter;
  final double lastPos;

  @override
  Widget build(BuildContext context) {
    final BookmarkBloc bookmarkBloc = BlocProvider.of<BookmarkBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapter,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: appBarTitleFs),
        ),
        actions: <Widget>[
          FontSizeButton(),
          DynamicThemeIconButton(),
          IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () {
                bookmarkBloc.add(BookmarkChanged(
                    lastChapter: chapter, text: text, title: title));
              })
        ],
      ),
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
                          data: title,
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
                      data: text,
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
