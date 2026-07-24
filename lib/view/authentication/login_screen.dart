import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/authentication/auth_vm.dart';

/// Shown when the user is unauthenticated.
///
/// The username/password "Sign In" form is present for branding only — there is
/// no credential-login backend yet, so it shows a "coming soon" prompt. The real
/// login is the "Sign in with UNIMAS Identity" button, which triggers the OAuth
/// (PKCE) flow via [AuthViewModel.login].
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final authVm = context.watch<AuthViewModel>();
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        // Vertically center the card, but allow scrolling when the keyboard
        // pushes content beyond the viewport.
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 48, // minus vertical padding
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1A000000), // rgba(0,0,0,0.1)
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Logo
                          Center(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: colors.surface,
                              backgroundImage: const AssetImage(
                                'assets/images/UNIMAS-logo.png',
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Headings
                          Text(
                            'Welcome to UNIMAS Sihat',
                            textAlign: TextAlign.center,
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colors.onSurface,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your health journey starts here.',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Username
                          _LabeledTextField(
                            label: 'Username',
                            hint: 'UNIMAS Identity',
                            prefixIcon: const Icon(Icons.person_outline),
                          ),
                          const SizedBox(height: 12),
                          // Password
                          _LabeledTextField(
                            label: 'Password',
                            hint: '••••••••',
                            obscureText: _obscurePassword,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              tooltip: _obscurePassword
                                  ? 'Show password'
                                  : 'Hide password',
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Primary "Sign In" (visual-only)
                          FilledButton(
                            style: FilledButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Credential login coming soon — use '
                                  '"Sign in with UNIMAS Identity".',
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Sign In'),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, size: 18),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Divider with "or"
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'or',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Error from a failed SSO attempt
                          if (authVm.errorMessage != null) ...[
                            Text(
                              authVm.errorMessage!,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: colors.error),
                            ),
                            const SizedBox(height: 8),
                          ],
                          // SSO login (real)
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: authVm.isAuthenticating
                                ? null
                                : () => authVm.login(),
                            icon: authVm.isAuthenticating
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(Icons.school_outlined),
                            label: const Text('Sign in with UNIMAS Identity'),
                          ),
                          const SizedBox(height: 24),
                          // Footer links (static, non-navigable)
                          for (final link in const [
                            'Privacy Policy',
                            'Terms of Service',
                            'University SSO Help',
                          ])
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                link,
                                textAlign: TextAlign.center,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// A labeled text field used by the login form. Visual only for now — it does
/// not wire to any auth logic until a credential-login backend exists.
class _LabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const _LabeledTextField({
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.outlineVariant),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: colors.surfaceContainerLowest,
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: BorderSide(color: colors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
