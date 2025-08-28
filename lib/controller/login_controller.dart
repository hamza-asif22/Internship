import 'package:flutter/material.dart';
import 'package:task1/view/homescreen_view.dart';
import '../model/login_model.dart';
import '../view/login_view.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool rememberMe = false;

  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);

  void toggleRememberme(bool? value) {
    rememberMe = value ?? false;
  }

  void showPassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void loginButton(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password!")),
      );
      return;
    }
    Navigator.of(context).pushReplacementNamed('/home');
  }

  void forgotPassword(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/forgotpassword');
  }
  void signup(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/signup');
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    obscurePassword.dispose();
  }
}
