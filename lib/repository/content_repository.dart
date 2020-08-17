// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

abstract class ContentRepository {
  Future<dynamic> getContents();
}

class ContentJsonRepository implements ContentRepository {
  @override
  Future<dynamic> getContents() async {
    final String data = await rootBundle.loadString('assets/content.json');
    return json.decode(data);
  }
}
