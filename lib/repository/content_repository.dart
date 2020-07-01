import 'dart:convert';
import 'package:flutter/services.dart';

class ContentRepository {
  static Future<dynamic> getContents() async {
    String data = await rootBundle.loadString('assets/content.json');
    return json.decode(data);
  }
}
