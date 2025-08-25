import 'package:flutter/material.dart';

class AddCardcontroller {
  final nameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final dateController = TextEditingController();
  final cvcController = TextEditingController();

  void addCard(BuildContext context) {
    final name = nameController.text.trim();
    final cardnumber = cardNumberController.text.trim();
    final date = dateController.text.trim();
    final cvc = cvcController.text.trim();

    if (cvc.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CVC must be atleast 3 digits.')),
      );
    }

    if (name.isEmpty || cardnumber.isEmpty || date.isEmpty || cvc.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields.')));
    }
  }

  String formatCardNumber(String input) {
    final digitsOnly = input.replaceAll(RegExp(r'\D'), '');
    final spaced = digitsOnly.replaceAllMapped(
      RegExp(r'.{4}'),
      (match) => '${match.group(0)}',
    );
    return spaced.trim();
  }

  String formatExpireDate(String input) {
    final digitsOnly = input.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length >= 5) {
      return '${digitsOnly.substring(0, 2)}/${digitsOnly.substring(2, 6)}';
    }
    return digitsOnly;
  }

  String formatCVC(String input) {
    final digitOnly = input.replaceAll(RegExp(r'\D'), '');
    return digitOnly.substring(0, digitOnly.length);
  }
}
