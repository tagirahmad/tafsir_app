// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

abstract class BookmarkRepository {
  Future<Map<String, dynamic>> getLastPos();
  Future<void> setLastPos(String text, String title, String lastChapter);
}

class BookmarkLocalRepository implements BookmarkRepository {
  @override
  Future<Map<String, dynamic>> getLastPos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String lastChapter = prefs.getString('lastChapter');
    final String text = prefs.getString('text');
    final String title = prefs.getString('title');
    return <String, String>{
      'text': text,
      'lastChapter': lastChapter,
      'title': title
    };
  }

  @override
  Future<void> setLastPos(String text, String title, String lastChapter) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastChapter', lastChapter);
    await prefs.setString('text', text);
    await prefs.setString('title', title);
  }
}
