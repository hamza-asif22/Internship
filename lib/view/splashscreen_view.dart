import 'package:flutter/material.dart';
import 'package:task1/constants/color/splashscreen.dart';
import 'package:task1/constants/images/splashscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/onboard');
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageSize = screenWidth * 0.4;
    return Scaffold(
      backgroundColor: SplashColor.bg,
      body: Center(
        child: Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(SplashImage.logo),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
