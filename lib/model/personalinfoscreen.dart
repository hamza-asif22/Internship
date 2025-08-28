import 'package:flutter/widgets.dart';

class PersonalData {
  String image;
  String name;
  String des;

  PersonalData({required this.image, required this.name, required this.des});
}

class PersonalInformation {
  String data;
  final String title;
  final IconData icons;
  final Color colors;

  PersonalInformation({required this.data,required this.colors ,required this.icons, required this.title});
}
