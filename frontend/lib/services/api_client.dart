import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/api_config.dart';

class ApiClient {
  static Uri _u(String path) => Uri.parse('${ApiConfig.baseUrl}$path');

  static Future<dynamic> get(String path, {String? token}) async {
    final res = await http.get(
      _u(path),
      headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
    return _handle(res);
  }

  static Future<dynamic> post(String path, {Map<String, dynamic>? body, String? token}) async {
    final res = await http.post(
      _u(path),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body ?? const {}),
    );
    return _handle(res);
  }

  static dynamic _handle(http.Response res) {
    dynamic data;
    try {
      data = res.body.isEmpty ? null : jsonDecode(res.body);
    } catch (_) {
      data = res.body;
    }

    if (res.statusCode >= 200 && res.statusCode < 300) return data;

    final msg = (data is Map && data['message'] != null)
        ? data['message'].toString()
        : 'HTTP ${res.statusCode}';
    throw Exception(msg);
  }
}
