import 'package:flutter/foundation.dart';
import '../../networking/authentication/auth_feeder.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthViewModel extends ChangeNotifier {
  final _authFeeder = AuthFeeder();
  AuthStatus status = AuthStatus.unknown;
  String? errorMessage;
  bool isAuthenticating = false;

  Future<void> checkAuthStatus() async {
    final loggedIn = await _authFeeder.isLoggedIn();
    status = loggedIn ? AuthStatus.authenticated : AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<bool> login() async {
    isAuthenticating = true;
    errorMessage = null;
    notifyListeners();

    final success = await _authFeeder.login();

    isAuthenticating = false;
    status = success ? AuthStatus.authenticated : AuthStatus.unauthenticated;
    errorMessage = success ? null : 'Login failed.';
    notifyListeners();
    return success;
  }

  Future<void> logout() async {
    await _authFeeder.logout();
    status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}