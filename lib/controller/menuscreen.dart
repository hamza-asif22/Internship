import 'package:flutter/material.dart';
import 'package:task1/model/menuscreen.dart';

class ProfileController {
  final PersonalData personalData = PersonalData(
    image: 'assets/menuscreen/profile.png',
    name: 'John Doe',
    des: 'I love fast food',
  );

  final List<List<MenuSection>> menusection = [
    [
      MenuSection(
        title: 'Personal Info',
        route: '/personalinfo',
        icon: Icons.person_2_outlined,
        color: Colors.deepOrangeAccent,
      ),
      MenuSection(
        title: 'Addresses',
        route: '/address',
        icon: Icons.map_outlined,
        color: Colors.blueAccent,
      ),
    ],
    [
      MenuSection(
        title: "Cart",
        route: "/cart",
        icon: Icons.shopping_bag_outlined,
        color: Colors.lightBlueAccent,
      ),
      MenuSection(
        title: "Favourite",
        route: "/favourite",
        icon: Icons.favorite_border_outlined,
        color: Colors.purple,
      ),
      MenuSection(
        title: "Notifications",
        route: "/notifications",
        icon: Icons.notifications_active_outlined,
        color: Colors.orangeAccent,
      ),
      MenuSection(
        title: "Payment Method",
        route: "/payment",
        icon: Icons.payment_outlined,
        color: Colors.lightBlue,
      ),
    ],
    [
      MenuSection(
        title: "FAQs",
        route: "/faqs",
        icon: Icons.help_outline,
        color: Colors.deepOrangeAccent,
      ),
      MenuSection(
        title: "User Reviews",
        route: "/reviews",
        icon: Icons.reviews_outlined,
        color: Colors.greenAccent,
      ),
      MenuSection(
        title: "Settings",
        route: "/settings",
        icon: Icons.settings_outlined,
        color: Colors.blueAccent,
      ),
    ],
    [
      MenuSection(
        title: "Log Out",
        route: "/login",
        icon: Icons.logout_outlined,
        color: Colors.red,
      ),
    ],
  ];
}
