// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

abstract class FontRepository {
  Future<double> getFontSize();
  Future<void> setFontSize(double fontSize);
}

class FontLocalRepository implements FontRepository {
  @override
  Future<double> getFontSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double size = prefs.getDouble('fontSizeStore') ?? 15;

    return size;
  }

  @override
  Future<void> setFontSize(double fontSize) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSizeStore', fontSize);
  }
}
