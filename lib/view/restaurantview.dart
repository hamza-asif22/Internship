import 'package:flutter/material.dart';
import 'package:task1/controller/reataurantcontroller.dart';
import 'package:task1/controller/searchscreen.dart';
import 'package:task1/model/searchscreen.dart';
import 'package:task1/view/fooddetailscreen.dart';

class RestaurantView extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantView({super.key, required this.restaurant});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  String? selecteditem;
  bool isAdded = false;
  final searchcontrol = FoodSearchController();
  final restaurantcontrol = RestaurantController();

  List<FastFood> filteredFood = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 26.0,
              vertical: 28.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 18),
                    const Text(
                      "Restaurant View",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
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
                        onPressed: () {
                          restaurantcontrol.showOfferPopup(context);
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(36),
                    image: DecorationImage(
                      image: AssetImage(widget.restaurant.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 28),
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.restaurant.des,
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 22),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_border_outlined,
                      color: Colors.deepOrangeAccent,
                      size: 24,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.restaurant.rating.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 36),
                    const Icon(
                      Icons.delivery_dining,
                      size: 24,
                      color: Colors.deepOrangeAccent,
                    ),
                    const Text(" Free", style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 36),
                    const Icon(
                      Icons.access_time,
                      size: 24,
                      color: Colors.deepOrangeAccent,
                    ),
                    Text(" ${widget.restaurant.delivery} min"),
                  ],
                ),

                const SizedBox(height: 32),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        searchcontrol.recentSearches.map((word) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: ChoiceChip(
                              label: Text(word),
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    word == selecteditem
                                        ? Colors.white
                                        : Colors.black,
                              ),
                              backgroundColor: Colors.white,
                              selectedColor: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              showCheckmark: false,
                              selected: selecteditem == word,
                              onSelected: (value) {
                                setState(() {
                                  selecteditem = value ? word : null;

                                  filteredFood =
                                      selecteditem == null
                                          ? []
                                          : searchcontrol.filterbycategory(
                                            selecteditem!,
                                          );
                                });
                              },
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: 22),
                if (selecteditem != null)
                  Text(
                    '$selecteditem (${filteredFood.length})',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                SizedBox(height: 12),
                SingleChildScrollView(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children:
                        filteredFood.map((food) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 14.0,
                              bottom: 14,
                              left: 26,
                              right: 26,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => FoodDetails(food: food),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      food.img,
                                      fit: BoxFit.cover,
                                      height: 83,
                                      width: double.infinity,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    food.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    food.restaurant,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  SizedBox(height: 0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${food.price.toInt()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            isAdded ? Icons.check : Icons.add,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          onPressed:
                                              () => setState(() {
                                                isAdded = !isAdded;
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  const SnackBar(
                                                    content: Text('Item Added'),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
