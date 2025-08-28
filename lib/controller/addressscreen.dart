import 'package:flutter/material.dart';
import 'package:task1/model/addressscreen.dart';

class AddressController {
  

  final List<AddressModel> addresspage = [
      AddressModel(
        data: '2464 Royal Ln. Mesa, New Jersey \n45463',
        title: "HOME",
        icons: Icons.home_outlined,
        colors: Colors.lightBlueAccent,
      ),
      AddressModel(
        data: '3891 Ranchview Dr. Richardson, \nCalifornia 62639',
        title: "WORK",
        icons: Icons.work_outline,
        colors: Colors.purple,
      ),
    
  ];
}
