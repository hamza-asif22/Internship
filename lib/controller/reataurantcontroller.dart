import 'package:flutter/material.dart';
import 'package:task1/model/restaurantmodel.dart';

class RestaurantController {
  List<RestaurantModel> restaurant = [
    RestaurantModel(
      offers: ['Delivery', 'Pick Up', 'Offer', 'Online payment available'],
      pricing: ['\$', '\$\$', '\$\$\$'],
      timing: ['10-15 min', '20 min', '30 min'],
    ),
  ];

  void showOfferPopup(BuildContext context) {
    String? selectedOffer;
    String? selectedTime;
    String? selectedPrice;
    int selectedRating = 0;
    final screenSize = MediaQuery.of(context).size;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                width: screenSize.width * 0.95,
                height: screenSize.height * 0.75,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(height: 12),
                          Text(
                            'Filter your search',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.close, size: 24),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      const Text(
                        'OFFERS',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 18,
                        children:
                            restaurant[0].offers.map((offer) {
                              return ChoiceChip(
                                showCheckmark: false,
                                labelPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                label: Text(
                                  offer,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        selectedOffer == offer
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                                selected: selectedOffer == offer,
                                selectedColor: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.white,
                                onSelected: (bool selected) {
                                  setState(() {
                                    selectedOffer = offer;
                                  });
                                },
                              );
                            }).toList(),
                      ),
                      SizedBox(height: 22),
                      Text(
                        'DELIVERY TIME',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        spacing: 16,
                        children:
                            restaurant[0].timing.map((time) {
                              return ChoiceChip(
                                showCheckmark: false,
                                labelPadding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 4,
                                ),
                                label: Text(
                                  time,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        selectedTime == time
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                                selected: selectedTime == time,
                                selectedColor: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                backgroundColor: Colors.white,
                                onSelected: (bool selected) {
                                  setState(() {
                                    selectedTime = time;
                                  });
                                },
                              );
                            }).toList(),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'PRICING',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        children:
                            restaurant[0].pricing.map((price) {
                              return SizedBox(
                                width: 62,
                                height: 62,
                                child: Center(
                                  child: ChoiceChip(
                                    showCheckmark: false,
                                    labelPadding: EdgeInsets.all(6),
                                    label: Text(
                                      price,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            selectedPrice == price
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                    selected: selectedPrice == price,
                                    selectedColor: Colors.deepOrangeAccent,
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.white,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedPrice = price;
                                      });
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                      ),

                      SizedBox(height: 32),
                      Text(
                        'RATING',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 16,
                        children: List.generate(5, (index) {
                          int starValue = index + 1;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedRating = starValue;
                              });
                            },
                            child: Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.star,
                                size: 22,
                                color:
                                    starValue <= selectedRating
                                        ? Colors.deepOrangeAccent
                                        : Colors.grey.shade300,
                              ),
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 32),
                      SizedBox(
                        height: 62,

                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'FILTER',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
