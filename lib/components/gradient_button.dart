// Flutter imports:
import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/models/button_type.dart';
import 'package:tafsir_albaqara/models/chapter.dart';
import 'package:tafsir_albaqara/screens/chapter_screen.dart';

// Project imports:
import 'package:tafsir_albaqara/screens/list_of_content.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';
import 'package:tafsir_albaqara/statics/styles.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({@required this.buttonType, this.chapter});
  final ButtonType buttonType;
  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: buttonBorderRad,
        ),
        padding: zeroPadding,
        onPressed: () => _resolveButtonNavigation(buttonType, context, chapter),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: buttonBorderRad,
            gradient: const LinearGradient(
              colors: <Color>[
                Colors.indigoAccent,
                Color(0xFF7630ff),
              ],
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: buttonHeight,
            alignment: Alignment.center,
            child: _resolveButtonText(buttonType, chapter.chapterName),
          ),
        ),
      ),
    );
  }

  void _resolveButtonNavigation(
      ButtonType buttonType, BuildContext context, Chapter chapter) {
    switch (buttonType) {
      case ButtonType.continueReading:
        Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => ChapterScreen(
                    chapter: Chapter(
                        text: chapter.text,
                        title: chapter.title,
                        chapterName: chapter.chapterName))));
        break;
      case ButtonType.toContentList:
        Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => ListOfContent()));
        break;
      default:
        return;
    }
  }

  Text _resolveButtonText(ButtonType buttonType, String chapterName) {
    switch (buttonType) {
      case ButtonType.continueReading:
        return Text(
          '${GlobalConstants.continueReadingFrom} $chapterName',
          style: TextStyle(color: Colors.white, fontSize: continueReadingBtn),
        );
        break;
      case ButtonType.toContentList:
        return Text(GlobalConstants.toListOfContents,
            style: TextStyle(color: Colors.white, fontSize: toChapters));
        break;
      default:
        return null;
    }
  }
}
