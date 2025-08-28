import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task1/view/addcardscreen.dart';
import 'package:task1/view/addressscreen.dart';
import 'package:task1/view/cart_view.dart';
import 'package:task1/view/editprofilescreen.dart';
import 'package:task1/view/forgotpassword_view.dart';
import 'package:task1/view/homescreen_view.dart';
import 'package:task1/view/login_view.dart';
import 'package:task1/view/menuscreen.dart';
import 'package:task1/view/myorderscreen.dart';
import 'package:task1/view/newaddressscreen.dart';
import 'package:task1/view/onboard_screen.dart';
import 'package:task1/view/payementscreen.dart';
import 'package:task1/view/paymentsuccessscreen.dart';
import 'package:task1/view/personalinfoscreen.dart';
import 'package:task1/view/searchscreen.dart';
import 'package:task1/view/signup_view.dart';
import 'package:task1/view/splashscreen_view.dart';
import 'package:task1/view/verifyscreen_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/splash',

      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LogIn(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignUp(),
        '/forgotpassword': (context) => const ForgotPassword(),
        '/verify': (context) => const Verification(),
        '/onboard': (context) => const OnBoard(),
        '/cartscreen': (context) => CartScreen(),
        '/payementscreen': (context) => PayementScreen(),
        '/addcardscreen': (context) => AddCardScreen(),
        '/paymentsuccessscreen': (context) => const PayementSuccessScreen(),
        '/searchscreen': (context) => const SearchPage(),
        '/menuscreen': (context) => const MenuScreen(),
        '/personalinfo': (context) => const PersonalInfo(),
        '/editprofile': (context) => const EditProfile(),
        '/address': (context) => const AddressScreen(),
        '/newaddress': (context) => const NewAddressScreen(),
        '/myorder': (context) => const MyOrder(),
      },
    );
  }
}
