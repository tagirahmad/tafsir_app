import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:tafsir_albaqara/ui/DynamicThemeIconButton.dart';
import 'package:tafsir_albaqara/ui/FontSizeButton.dart';
import 'package:tafsir_albaqara/ui/FontSizePickerDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageContent extends StatefulWidget {
  final String text;
  final String title;
  final String chapter;
  final double initialFontSize = 15;
  PageContent(
      {@required this.text, @required this.title, @required this.chapter});

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  double _fontSize = 15.0;
  // double size;
  ScrollController controller;
  // void updateState(double fontSize) async {
  //   setState(() {
  //     _fontSize = fontSize;
  //   });
  // }

  // void _showFontSizePickerDialog() async {
  //   final selectedFontSize = await showDialog<double>(
  //     context: context,
  //     builder: (context) => FontSizePickerDialog(
  //       initialFontSize: _fontSize,
  //       updateTextFunction: updateState,
  //     ),
  //   );
  //   if (selectedFontSize != null) {
  //     setState(() {
  //       _fontSize = selectedFontSize;
  //     });
  //   }
  // }

  void getFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    double size = (prefs.getDouble('fontSizeStore') ?? 15);
    setState(() {
      _fontSize = size;
    });
  }

  @override
  void initState() {
    super.initState();
    getFontSize();
  }
void updateState(double fontSize) async {
    setState(() {
      _fontSize = fontSize;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.chapter}',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          FontSizeButton(updateState: updateState,),
          DynamicThemeIconButton(),
        ],
      ),
      body: SingleChildScrollView(
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
                      data: widget.title,
                      defaultTextStyle:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: _fontSize +5),
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
                  data: widget.text,
                  customTextStyle: (node, baseStyle) {
                    if (node is dom.Element) {
                      switch (node.localName) {
                        case "h2":
                          return TextStyle(fontSize: _fontSize + 10);
                        case "h3":
                          return TextStyle(fontSize: _fontSize + 6);
                        case "h4":
                          return TextStyle(fontSize: _fontSize + 3);
                      }
                    }
                  },
                  defaultTextStyle: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: _fontSize),
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
      ),
    );
  }
}
