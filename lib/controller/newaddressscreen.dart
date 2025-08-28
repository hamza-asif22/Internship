import 'package:flutter/material.dart';

class NewAddressController {
  final addressd = TextEditingController();
  final street = TextEditingController();
  final postcode = TextEditingController();
  final apartment = TextEditingController();

  List<String> places = ['Home', 'Work', 'Other'];
}
