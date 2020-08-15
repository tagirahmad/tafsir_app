// Flutter imports:
import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/models/chapter.dart';

// Project imports:
import 'package:tafsir_albaqara/screens/chapter_screen.dart';
import 'package:tafsir_albaqara/statics/styles.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({Key key, this.chapter}) : super(key: key);

  final Chapter chapter;

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
          chapter.chapterName,
          style: TextStyle(fontSize: cardChapterFs),
        ),
        subtitle: Text(
          chapter.title,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: cardTitleFs),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    ChapterScreen(chapter: chapter),
              ));
        },
      ),
    );
  }
}
