import 'package:flutter/material.dart';
import 'package:task1/model/personalinfoscreen.dart';

class PerInfoController {
  final PersonalData personalInfodata = PersonalData(
    image: 'assets/menuscreen/profile.png',
    name: 'John Doe',
    des: 'I love fast food',
  );

  final List<PersonalInformation> personalinfopage = [
      PersonalInformation(
        data: 'John Doe',
        title: "FULL NAME",
        icons: Icons.person_outlined,
        colors: Colors.deepOrangeAccent,
      ),
      PersonalInformation(
        data: 'hello@gmail.com',
        title: "EMAIL",
        icons: Icons.email_outlined,
        colors: Colors.blue,
      ),
      PersonalInformation(
        data: '408-841-0926',
        title: "PHONE NUMBER",
        icons: Icons.phone_outlined,
        colors: Colors.blueAccent,
      ),
    
  ];
}
