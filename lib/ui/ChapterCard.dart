import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/screens/ContentPage.dart';
import 'package:tafsir_albaqara/statics/styles.dart';

class ChapterCard extends StatelessWidget {
  final String chapter;
  final String title;
  final String text;

  const ChapterCard({Key key, this.chapter, this.title, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.fromLTRB(15, 5, 10, 5),
        title: Text(
          '$chapter',
          style: TextStyle(fontSize: cardChapterFs),
        ),
        subtitle: Text(
          '$title',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: cardTitleFs),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageContent(
                        text: text,
                        title: title,
                        chapter: chapter,
                      )));
        },
      ),
    );
  }
}
