// lib/config/auth_config.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthConfig {
  static String get clientId => dotenv.env['AUTH_CLIENT_ID']!;
  static String get redirectUri => dotenv.env['AUTH_REDIRECT_URI']!;
  static String get authorizationEndpoint => dotenv.env['AUTH_AUTHORIZATION_ENDPOINT']!;
  static String get tokenEndpoint => dotenv.env['AUTH_TOKEN_ENDPOINT']!;
  static const List<String> scopes = ['openid', 'profile'];
}