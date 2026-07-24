

import 'package:flutter/foundation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import '../../config/auth_config.dart';
import '../../utils/token_storage.dart';

class AuthFeeder {
  final _appAuth = FlutterAppAuth();

  Future<bool> login() async {
    try {
      final result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AuthConfig.clientId,
          AuthConfig.redirectUri,
          serviceConfiguration: AuthorizationServiceConfiguration(
            authorizationEndpoint: AuthConfig.authorizationEndpoint,
            tokenEndpoint: AuthConfig.tokenEndpoint,
          ),
          scopes: AuthConfig.scopes,
        ),
      );

      if (result.accessToken == null) return false;

      await TokenStorage.saveTokens(
        result.accessToken!,
        result.refreshToken ?? '',
      );
      return true;
    } catch (e, st) {
      debugPrint('AuthFeeder.login failed: $e\n$st');
      return false;
    }
  }

  Future<void> logout() async {
    await TokenStorage.clear();
    // If your auth server has an end-session endpoint, call it here too
  }

  Future<bool> isLoggedIn() async {
    final token = await TokenStorage.getAccessToken();
    return token != null;
  }
}