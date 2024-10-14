import 'dart:convert';

extension Base64Encode on String {
  String get base64Encode => base64.encode(utf8.encode(this));
}