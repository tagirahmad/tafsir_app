import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:tafsir_albaqara/ui/DynamicThemeIconButton.dart';
import 'package:tafsir_albaqara/ui/FontSizeButton.dart';

// class PageContent extends StatefulWidget {
//   final String text;
//   final String title;
//   final String chapter;
//   final double initialFontSize = 15;
//   final double lastPos;
//   final Function() updateMainState;
//   PageContent(
//       {@required this.text,
//       @required this.title,
//       @required this.chapter,
//       this.lastPos,
//       this.updateMainState});

//   @override
//   _PageContentState createState() => _PageContentState();
// }

class PageContent extends StatelessWidget {
  final String text;
  final String title;
  final String chapter;
  final double initialFontSize = 15;
  final double lastPos;
  // final Function() updateMainState;
  PageContent(
      {@required this.text,
      @required this.title,
      @required this.chapter,
      this.lastPos,
      // this.updateMainState
      });
  // double _fontSize = 15.0;
  // ScrollController controller;
  // double lastPos;

  // void getFontSize() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   double size = (prefs.getDouble('fontSizeStore') ?? 15);
  //   setState(() {
  //     _fontSize = size;
  //   });
  // }

  // @override
  // void initState() {
  //   getFontSize();
  //   controller = ScrollController();
  //   // getLastPos();
  //   // checkLastPos();
  //   super.initState();
  // }

  // void updateState(double fontSize) async {
  //   setState(() {
  //     _fontSize = fontSize;
  //   });
  // }

  // void saveLastPos() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setDouble('lastPos', controller.offset);
  //   await prefs.setString("lastChapter", widget.chapter);
  //   await prefs.setString("text", widget.text);
  //   await prefs.setString("title", widget.title);
  //   print(prefs.getDouble("lastPos"));
  //   print(prefs.getString("lastChapter"));
  //   // widget.updateMainState();
  // }

  // Future<void> checkLastPos() async {
  //   print("${widget.lastPos} is lastpos");
  //   if (widget.lastPos != 0) {
  //     controller.jumpTo(widget.lastPos);
  //   } else {
  //     // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     // lastPos =  prefs.getDouble('lastPos' ?? 0);
  //     // controller.jumpTo(lastPos);
  //     controller.jumpTo(0);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final FontSizeBloc fontSizeBloc = BlocProvider.of<FontSizeBloc>(context);

    ScrollController controller = ScrollController();

    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   setState(() {

      //   });
      // }),
      appBar: AppBar(
        title: Text(
          '$chapter',
          // 'chapter',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          FontSizeButton(
            // updateState: updateState,
          ),
          DynamicThemeIconButton(),
          IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                // final SharedPreferences prefs = await SharedPreferences.getInstance();
                // double lastPos = prefs.getDouble("lastPos");
                // controller
                //     .jumpTo(lastPos);
                // saveLastPos(); 
              })
        ],
      ),
      body: BlocBuilder<FontSizeBloc, FontSizeState>(
        builder: (BuildContext context, FontSizeState state) {
          return SingleChildScrollView(
            controller: controller,
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
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
                          // data: "title",
                          defaultTextStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: state.fontSize
                          ),
                          customTextAlign: (dom.Node node) {
                            return TextAlign.center;
                          },
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  Html(
                      data: text,
                      customTextStyle: (node, baseStyle) {
                        if (node is dom.Element) {
                          switch (node.localName) {
                            case "h2":
                              return TextStyle(fontSize: state.fontSize + 10);
                            case "h3":
                              return TextStyle(fontSize: state.fontSize + 6);
                            case "h4":
                              return TextStyle(fontSize: state.fontSize + 3);
                          }
                        }
                      },
                      defaultTextStyle: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: state.fontSize),
                      customTextAlign: (dom.Node node) {
                        if (node is dom.Element) {
                          switch (node.localName) {
                            case "h2":
                              return TextAlign.center;
                            case "h3":
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
