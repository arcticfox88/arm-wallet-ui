import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

String doMd5(String data) {
  var byte = utf8.encode(data);
  var digest = md5.convert(byte);
  return hex.encode(digest.bytes);
}
