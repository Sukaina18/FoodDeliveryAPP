import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<Map<String, dynamic>> loadJson(String path) async {
  String jsonString = await rootBundle.loadString(path);
  return json.decode(jsonString);
}
