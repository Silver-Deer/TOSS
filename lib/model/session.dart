import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Session {
  static Map<String, String> _header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<Map<String, dynamic>> get(String uri,
      {bool isTokenRequired = true}) async {
    String? token = await storage.read(key: 'token');
    Map<String, String> tokenHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? ""
    };

    final response = await http.get(Uri.parse(uri),
        headers: isTokenRequired ? tokenHeader : _header);

    Map<String, dynamic> res = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return res;
    } else {
      throw Exception("${response.statusCode} ${res['msg']}");
    }
  }

  static Future<dynamic> post(String uri, dynamic data,
      {bool isTokenRequired = true}) async {
    String? token = await storage.read(key: 'token');
    Map<String, String> tokenHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? ""
    };

    final response = await http.post(Uri.parse(uri),
        body: json.encode(data),
        headers: isTokenRequired ? tokenHeader : _header);

    dynamic res = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return res;
    } else {
      throw Exception("${response.statusCode} ${res['msg']}");
    }
  }
}
