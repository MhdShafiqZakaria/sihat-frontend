import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../utils/token_storage.dart';

class GetQueueNumberService {
  final String baseUrl;

  GetQueueNumberService({required this.baseUrl});

  /// Builds auth headers. Prefers the OAuth bearer token from secure storage;
  /// falls back to Basic auth credentials from `.env` when no token is present
  /// (transition path until the backend accepts bearer tokens).
  Future<Map<String, String>> _buildHeaders() async {
    final token = await TokenStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      return {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
    }
    return {
      'Authorization': _basicAuthHeader(),
      'Content-Type': 'application/json',
    };
  }

  String _basicAuthHeader() {
    final username = dotenv.env['AUTH_BASIC_USERNAME'] ?? '';
    final password = dotenv.env['AUTH_BASIC_PASSWORD'] ?? '';
    if (username.isEmpty || password.isEmpty) {
      throw StateError(
        'Basic auth credentials missing. Set AUTH_BASIC_USERNAME and '
        'AUTH_BASIC_PASSWORD in .env, or sign in via OAuth.',
      );
    }
    final credentials = base64Encode(utf8.encode('$username:$password'));
    return 'Basic $credentials';
  }

  //GET Method
  Future<http.Response> get(String path) async {
    return http
        .get(Uri.parse('$baseUrl$path'), headers: await _buildHeaders())
        .timeout(const Duration(seconds: 15));
  }

  //POST Method
  Future<http.Response> post(String path, {required Object body}) async {
    return http
        .post(
          Uri.parse('$baseUrl$path'),
          headers: await _buildHeaders(),
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 15));
  }
}
