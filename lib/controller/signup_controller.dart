import 'package:flutter/material.dart';

class SignupController {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  final ValueNotifier<bool> obscurepassword = ValueNotifier(true);
  final ValueNotifier<bool> confirmpasswordobscure = ValueNotifier(true);

  void showPassword() {
    obscurepassword.value = !obscurepassword.value;
  }

  void showConfirmPassword() {
    confirmpasswordobscure.value = !confirmpasswordobscure.value;
  }

  void signup(BuildContext context) {
    final name = namecontroller.text.trim();
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();
    final confirmpassword = confirmpasswordcontroller.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmpassword.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields!")));
      return;
    }
    Navigator.of(context).pushReplacementNamed('/login');
  }
  
  void dispose() {
  namecontroller.dispose();
  emailcontroller.dispose();
  passwordcontroller.dispose();
  confirmpasswordcontroller.dispose();
  obscurepassword.dispose();
  confirmpasswordobscure.dispose();
}

}
