import 'package:flutter/material.dart';
import 'package:task1/model/menuscreen.dart';
import 'package:task1/controller/menuscreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final menucontrol = ProfileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                ),
                const SizedBox(width: 18),
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz, size: 26),
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    menucontrol.personalData.image,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(width: 34),
                Column(
                  children: [
                    Text(
                      menucontrol.personalData.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      menucontrol.personalData.des,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(decoration: BoxDecoration(color: Colors.grey.shade400)),
          ],
        ),
      ),
    );
  }
}
