import 'package:flutter/material.dart';

class PersonalData {
  String image;
  String name;
  String des;

  PersonalData({required this.image, required this.name, required this.des});
}

class MenuSection {
  final String title;
  final String route;
  final IconData icon;
  final Color color;

  MenuSection({
    required this.title,
    required this.route,
    required this.icon,
    required this.color,
  });
}
