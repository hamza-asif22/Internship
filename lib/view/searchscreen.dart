import 'package:flutter/material.dart';
import 'package:task1/constants/color/searchscreen.dart';
import 'package:task1/constants/text/homescreen.dart';
import 'package:task1/constants/text/searchscreen.dart';
import 'package:task1/model/searchscreen.dart';
import 'package:task1/controller/searchscreen.dart';
import 'package:task1/view/fooddetailscreen.dart';
import 'package:task1/view/restaurantview.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchControl = FoodSearchController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List<FastFood> filteredFood =
        query.isEmpty
            ? searchControl.fastFood
            : searchControl.filterFood(query);
    List<Restaurant> filterRestaurant =
        query.isEmpty
            ? searchControl.restaurants
            : searchControl.filterRestaurant(query);

    return Scaffold(
      backgroundColor: SearchColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.04,
            vertical: screenSize.height * 0.015,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: SearchColor.backicon,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: screenSize.width * 0.04,
                            ),
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed('/home');
                            },
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.025),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              SearchText.header,
                              style: TextStyle(
                                color: SearchColor.black,
                                fontSize: screenSize.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed('/cartscreen');
                          },
                          child: Container(
                            padding: EdgeInsets.all(screenSize.width * 0.02),
                            decoration: BoxDecoration(
                              color: SearchColor.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              size: screenSize.width * 0.07,
                              color: SearchColor.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -4,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(screenSize.width * 0.02),
                            decoration: BoxDecoration(
                              color: SearchColor.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              HomescreenText.cart,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.03,
                                color: SearchColor.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.025),
                TextField(
                  controller: searchControl.searchController,
                  decoration: InputDecoration(
                    hintText: SearchText.hint,
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: SearchColor.grey200,
                    suffix:
                        searchControl.searchController.text.isNotEmpty
                            ? Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: SearchColor.grey400,
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  searchControl.searchController.clear();
                                  setState(() => query = "");
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: SearchColor.white,
                                  ),
                                ),
                              ),
                            )
                            : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => setState(() => query = value),
                ),
                SizedBox(height: 28),
                Text(
                  SearchText.recent,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: SearchColor.black,
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        searchControl.recentSearches.map((word) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Chip(
                              label: Text(word),
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              backgroundColor: SearchColor.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelPadding: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              side: BorderSide(color: SearchColor.grey300),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  SearchText.suggested,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: SearchColor.black,
                  ),
                ),
                SizedBox(height: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children:
                      filterRestaurant
                          .map(
                            (restaurant) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              RestaurantView(restaurant: restaurant),
                                    ),
                                  );
                                },
                               child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      restaurant.image,
                                      fit: BoxFit.cover,
                                      height: 68,
                                      width: 82,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurant.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: SearchColor.black,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_border_outlined,
                                            color: SearchColor.deeporange,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            restaurant.rating.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ),
                            ),
                          )
                          .toList(),
                ),
                SizedBox(height: 38),
                Text(
                  SearchText.fastfood,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: SearchColor.black,
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  children:
                      filteredFood
                          .map(
                            (food) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              FoodDetails(food: food),
                                    ),
                                  );
                                },

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 12),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        food.img,
                                        fit: BoxFit.cover,
                                        height: 96,
                                        width: 148,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      food.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    Text(
                                      food.restaurant,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: SearchColor.grey600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
