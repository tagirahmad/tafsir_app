// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class FontRepository {
  static Future<double> getFontSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double size = prefs.getDouble('fontSizeStore') ?? 15;

    return size;
  }

  static Future<void> setFontSize(double fontSize) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSizeStore', fontSize);
  }
}
