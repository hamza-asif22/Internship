import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FastFood {
  final String name;
  final double foodrating;
  final String description;
  final double price;
  final String restaurant;
  final int deliverytime;
  final String img;
  final List<String> sizes;
  final List<Widget> ingredients;
  int quantity;
  final String category;

  FastFood({
    required this.name,
    required this.foodrating,
    required this.description,
    required this.price,
    required this.restaurant,
    required this.deliverytime,
    required this.img,
    required this.sizes,
    required this.ingredients,
    required this.quantity,
    required this.category
  });
}

class Restaurant {
  String name;
  double rating;
  String image;
  final String des;
  final int delivery;

  Restaurant({
    required this.name,
    required this.rating,
    required this.image,
    required this.des,
    required this.delivery,
  });
}
