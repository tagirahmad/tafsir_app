// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tafsir_albaqara/screens/content_page.dart';
import 'package:tafsir_albaqara/statics/styles.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({Key key, this.chapter, this.title, this.text})
      : super(key: key);

  final String chapter;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
        title: Text(
          chapter,
          style: TextStyle(fontSize: cardChapterFs),
        ),
        subtitle: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: cardTitleFs),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => PageContent(
                        text: text,
                        title: title,
                        chapter: chapter,
                      )));
        },
      ),
    );
  }
}
