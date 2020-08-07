import 'package:shared_preferences/shared_preferences.dart';

class BookmarkRepository {
  static Future<Map<String, dynamic>> getLastPos() async {
    final prefs = await SharedPreferences.getInstance();
    String lastChapter = prefs.getString("lastChapter");
    String text = prefs.getString("text");
    String title = prefs.getString("title");

    return {
      'text': text,
      'lastChapter': lastChapter,
      'title': title
    };
  }

  static Future<void> setLastPos(
      String text, String title, String lastChapter) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lastChapter", lastChapter);
    await prefs.setString("text", text);
    await prefs.setString("title", title);
  }
}
