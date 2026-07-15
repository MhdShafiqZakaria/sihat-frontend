import 'dart:convert';
import 'package:http/http.dart' as http;

class GetQueueNumberService {
  final String baseUrl;

  //testing params
  static const _username = '97529';
  static const _password = 'Unimas!040204600013';

  GetQueueNumberService({required this.baseUrl});

  Map<String, String> _buildHeaders() {
    final credentials = base64Encode(utf8.encode('$_username:$_password'));
    return {
      'Authorization': 'Basic $credentials',
      'Content-Type': 'application/json',
    };
  }

  //GET Method
  Future<http.Response> get(String path) {
    return http
        .get(Uri.parse('$baseUrl$path'), headers: _buildHeaders())
        .timeout(const Duration(seconds: 15));
  }

  //POST Method
  Future<http.Response> post(String path, {required Object body}) {
    return http
        .post(
          Uri.parse('$baseUrl$path'),
          headers: _buildHeaders(),
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 15));
  }
}
