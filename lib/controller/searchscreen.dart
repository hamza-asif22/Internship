import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:task1/constants/color/searchscreen.dart';
import 'package:task1/constants/images/searchscreen.dart';
import 'package:task1/constants/text/searchscreen.dart';
import 'package:task1/model/searchscreen.dart';

class FoodSearchController {
  final searchController = TextEditingController();

  List<String> recentSearches = ['Pizza', 'Burger', 'Sandwich', 'Pasta'];

  List<Restaurant> restaurants = [
    Restaurant(
      name: SearchText.res1,
      rating: 4.7,
      des: SearchText.des,
      delivery: 30,
      image: SearchImage.res1,
    ),
    Restaurant(
      name: SearchText.res2,
      rating: 4.7,
      des: SearchText.des,
      delivery: 20,
      image: SearchImage.res2,
    ),
    Restaurant(
      name: SearchText.res3,
      rating: 4.3,
      des: SearchText.des,
      delivery: 50,
      image: SearchImage.res3,
    ),
    Restaurant(
      name: SearchText.res4,
      rating: 4.0,
      des: SearchText.des,
      delivery: 35,
      image: SearchImage.res4,
    ),
    Restaurant(
      name: SearchText.res5,
      rating: 4.9,
      des: SearchText.des,
      delivery: 30,
      image: SearchImage.res5,
    ),
    Restaurant(
      name: SearchText.res6,
      rating: 4.4,
      des: SearchText.des,
      delivery: 45,
      image: SearchImage.res6,
    ),
  ];

  List<FastFood> fastFood = [
    FastFood(
      name: SearchText.pizza1,
      foodrating: 4.7,
      description: SearchText.pizzades,
      price: 12.99,
      deliverytime: 30,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.tomato, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.basil, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.pizza1,
      restaurant: SearchText.res1,
      quantity: 1,
      category: 'Pizza',
    ),
    FastFood(
      name: SearchText.pizza2,
      foodrating: 4.3,
      description: SearchText.pizzades,
      price: 10.99,
      deliverytime: 30,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.mushroom, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.basil, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.pizza2,
      restaurant: SearchText.res6,
      quantity: 1,
      category: 'Pizza',
    ),
    FastFood(
      name: 'Peri Peri Pizza',
      foodrating: 4.0,
      description: SearchText.pizzades,
      price: 12,
      deliverytime: 40,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.basil, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.mushroom, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.pizza3,
      restaurant: SearchText.res1,
      quantity: 1,
      category: 'Pizza',
    ),
    FastFood(
      name: 'Veggie Pizza',
      foodrating: 4.5,
      description: SearchText.pizzades,
      price: 12.99,
      deliverytime: 50,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.tomato, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.basil, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.pizza4,
      restaurant: SearchText.res5,
      quantity: 1,
      category: 'Pizza',
    ),
    FastFood(
      name: 'Cheese Pizza',
      foodrating: 4.7,
      description: SearchText.pizzades,
      price: 22.99,
      deliverytime: 35,
      sizes: ["10\"", "12\"", "18\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.mushroom, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.basil, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.pizza5,
      restaurant: SearchText.res2,
      quantity: 1,
      category: 'Pizza',
    ),
    FastFood(
      name: 'Burger Bistro',
      foodrating: 4.9,
      description: 'A delicious European style with fresh ingredients.',
      price: 15.99,
      deliverytime: 20,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.tomato, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.burger1,
      restaurant: 'American Burger',
      quantity: 1,
      category: 'Burger',
    ),
    FastFood(
      name: 'Smokin Burger',
      foodrating: 4.2,
      description: 'A delicious burger with fresh ingredients.',
      price: 15.99,
      deliverytime: 20,
      sizes: ["10\"", "12\"", "18\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.burger2,
      restaurant: 'American Burger',
      quantity: 1,
      category: 'Burger',
    ),
    FastFood(
      name: 'Buffalo Burger',
      foodrating: 4.7,
      description: 'A delicious burger with fresh ingredients.',
      price: 12.99,
      deliverytime: 30,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.burger3,
      restaurant: SearchText.res5,
      quantity: 1,
      category: 'Burger',
    ),
    FastFood(
      name: 'Bullseye Burger',
      foodrating: 3.8,
      description: 'A delicious European style burger with fresh ingredients.',
      price: 7.99,
      deliverytime: 60,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.jalapeno, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.burger4,
      restaurant: SearchText.res1,
      quantity: 1,
      category: 'Burger',
    ),
    FastFood(
      name: 'Smash Burger',
      foodrating: 4.7,
      description: 'A delicious American style burger with fresh ingredients.',
      price: 12.99,
      deliverytime: 30,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.jalapeno, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.burger5,
      restaurant: SearchText.res4,
      quantity: 1,
      category: 'Burger',
    ),
    FastFood(
      name: 'Stuffed Sandwich',
      foodrating: 4.9,
      description:
          'A delicious European style sandwich with fresh ingredients.',
      price: 12.99,
      deliverytime: 30,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.tomato, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.san1,
      restaurant: SearchText.res1,
      quantity: 1,
      category: 'Sandwich',
    ),
    FastFood(
      name: 'Euro Sandwich',
      foodrating: 4.6,
      description:
          'A delicious European style sandwich with fresh ingredients.',
      price: 9.99,
      deliverytime: 40,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.jalapeno, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.tomato, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.san2,
      restaurant: SearchText.res4,
      quantity: 1,
      category: 'Sandwich',
    ),
    FastFood(
      name: 'club Sandwich',
      foodrating: 4.1,
      description: 'A delicious  sandwich with fresh ingredients.',
      price: 12.99,
      deliverytime: 30,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.tomato, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.san3,
      restaurant: SearchText.res5,
      quantity: 1,
      category: 'Sandwich',
    ),
    FastFood(
      name: 'Simple Sandwich',
      foodrating: 4.0,
      description: 'A delicious sandwich with fresh ingredients.',
      price: 5.99,
      deliverytime: 20,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.basil, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.san4,
      restaurant: SearchText.res1,
      quantity: 1,
      category: 'Sandwich',
    ),
    FastFood(
      name: 'Beef Sandwich',
      foodrating: 4.4,
      description: 'A delicious American sandwich with fresh ingredients.',
      price: 16.99,
      deliverytime: 45,
      sizes: ["10\"", "12\"", "14\""],
      ingredients: [
        Image.asset(SearchImage.cheese, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.chicken, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.olives, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.tomato, color: SearchColor.ingredienticon),
        Image.asset(SearchImage.lettuce, color: SearchColor.ingredienticon),
      ],
      img: SearchImage.san5,
      restaurant: SearchText.res6,
      quantity: 1,
      category: 'Sandwich',
    ),
  ];

  List<FastFood> filterFood(String query) {
    return fastFood
        .where(
          (fastfood) =>
              fastfood.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  List<FastFood> filterbycategory(String category) {
    return fastFood
        .where((food) => food.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  List<Restaurant> filterRestaurant(String query) {
    return restaurants
        .where(
          (restaurant) =>
              restaurant.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
