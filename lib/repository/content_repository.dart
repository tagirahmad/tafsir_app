// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

class ContentRepository {
  static Future<dynamic> getContents() async {
    final String data = await rootBundle.loadString('assets/content.json');
    return json.decode(data);
  }
}
