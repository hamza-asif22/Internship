import 'package:flutter/material.dart';

class ForgotPasswordController {
  final emailController = TextEditingController();

  void verifybutton(BuildContext context) {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Navigator.of(context).pushReplacementNamed('/verify');
    }
  }

  void dispose() {
    emailController.dispose();
  }
}
