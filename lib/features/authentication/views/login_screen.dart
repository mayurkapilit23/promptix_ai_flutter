import 'package:flutter/material.dart';
import 'package:promptix_ai_flutter/core/utils/app_routes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('home_scaffold'),

      body: SafeArea(
        child: Center(
          child: ShadButton.outline(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (Route<dynamic> route) => false,
              );
            },
            leading: FlutterLogo(),
            child: const Text('Sign In with Google'),
          ),
        ),
      ),
    );
  }
}
