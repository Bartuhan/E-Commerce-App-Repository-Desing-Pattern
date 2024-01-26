import 'dart:convert';

import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl = 'http://your-api-base-url.com';

  static Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endPoint'));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post({required String endPoint, dynamic data}) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/josn'},
      body: json.encode(data),
    );

    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put({required String endPoint, dynamic data}) async {
    final response = await http.put(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/josn'},
      body: json.encode(data),
    );

    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete({required String endPoint}) async {
    final response = await http.delete(Uri.parse(_baseUrl));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
