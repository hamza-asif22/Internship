import 'package:flutter/material.dart';
import 'package:task1/model/searchscreen.dart';

class FoodDetails extends StatefulWidget {
  final FastFood food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  String? selectedSize;
  bool isliked = false;

  @override
  void initState() {
    super.initState();
    if (widget.food.sizes.isNotEmpty) {
      selectedSize = widget.food.sizes[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26.0,
                vertical: 16.0,
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
                          icon: Icon(Icons.arrow_back_ios_new, size: 16),
                          onPressed: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed('/searchscreen');
                          },
                        ),
                      ),
                      SizedBox(width: 18),
                      const Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 46),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(36),
                            image: DecorationImage(
                              image: AssetImage(widget.food.img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          right: 22,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isliked = !isliked;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              child: Icon(
                                isliked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isliked ? Colors.red : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  Chip(
                    avatar: Icon(Icons.restaurant_rounded, color: Colors.red),
                    label: Text(widget.food.restaurant),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    side: BorderSide(color: Colors.grey.shade300, width: 1),
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  ),

                  const SizedBox(height: 18),
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.food.description,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_border_outlined,
                        color: Colors.deepOrangeAccent,
                        size: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        widget.food.foodrating.toString(),
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
                      Text(" ${widget.food.deliverytime} min"),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children:
                        [
                          const Text(
                            "SIZE:",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 18),
                          ...widget.food.sizes.map(
                            (size) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                labelPadding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                backgroundColor: Color.fromARGB(
                                  250,
                                  240,
                                  245,
                                  250,
                                ),
                                side: BorderSide(color: Colors.white, width: 0),
                                selectedColor: Colors.deepOrangeAccent,
                                shape: CircleBorder(),
                                label: Text(
                                  size,
                                  style: TextStyle(
                                    color:
                                        size == selectedSize
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                selected: size == selectedSize,
                                showCheckmark: false,
                                onSelected: (_) {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                              ),
                            ),
                          ),
                        ].toList(),
                  ),

                  const SizedBox(height: 26),
                  const Text(
                    "INGREDIENTS",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    children:
                        widget.food.ingredients
                            .map(
                              (ingredient) => Chip(
                                shape: const CircleBorder(
                                  side: BorderSide(color: Colors.white),
                                ),
                                backgroundColor: Color.fromARGB(
                                  250,
                                  255,
                                  235,
                                  228,
                                ),

                                label: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ingredient,
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$${(widget.food.price * widget.food.quantity).toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(42),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: screenHeight * 0.07,
                                width: screenWidth * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: screenWidth * 0.05,
                                  ),
                                  onPressed:
                                      () => setState(() {
                                        if (widget.food.quantity > 1) {
                                          widget.food.quantity--;
                                        }
                                      }),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05,
                                  vertical: 0,
                                ),
                                child: Text(
                                  "${widget.food.quantity}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.07,
                                width: screenWidth * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: screenWidth * 0.05,
                                  ),
                                  onPressed:
                                      () => setState(() {
                                        widget.food.quantity++;
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 62,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 32,
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${widget.food.name} ($selectedSize) added to cart",
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "ADD TO CART",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
