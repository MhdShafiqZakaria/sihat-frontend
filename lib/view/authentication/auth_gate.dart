import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/authentication/auth_vm.dart';
import '../shared/navigation_bar.dart';
import 'login_screen.dart';

/// Root widget that gates the app behind authentication.
///
/// On first build it checks secure storage for a stored token, then switches
/// between the login screen and the main app based on [AuthViewModel.status].
class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    // Check for a stored token once on startup.
    context.read<AuthViewModel>().checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    switch (context.watch<AuthViewModel>().status) {
      case AuthStatus.unknown:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case AuthStatus.authenticated:
        return const MyNavigationBar();
      case AuthStatus.unauthenticated:
        return const LoginScreen();
    }
  }
}
