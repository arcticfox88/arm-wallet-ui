import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gio/gio.dart' as g;

class API {
  static Future<g.Response> get(String path, {Map<String, String>? params}) {
    return g.get(encodeUri(path, params));
  }

  static String encodeUri(String path, Map<String, dynamic>? queryParameters) {
    return Uri.parse(path).replace(queryParameters: queryParameters).toString();
  }
}

extension ResponseExt on g.Response {
  dynamic toJson() async => await compute(jsonDecode, body);
}
