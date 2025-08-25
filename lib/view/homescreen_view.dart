import 'package:flutter/material.dart';
import 'package:task1/constants/images/homescreen.dart';
import 'package:task1/constants/text/homescreen.dart';
import 'package:task1/controller/homescreen_controller.dart';
import 'package:task1/view/searchscreen.dart';

import '../constants/color/homescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomescreenController homescreen = HomescreenController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homescreen.showOfferPopup(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HomeColor.white,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed('/menuscreen');
                          },
                          child: Container(
                            padding: EdgeInsets.all(screenSize.width * 0.02),
                            decoration: BoxDecoration(
                              color: HomeColor.backicon,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.menu,
                              size: screenSize.width * 0.06,
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              HomescreenText.location,
                              style: TextStyle(
                                color: HomeColor.orange,
                                fontSize: screenSize.width * 0.03,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  HomescreenText.address,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenSize.width * 0.03,
                                    color: HomeColor.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: screenSize.width * 0.04,
                                ),
                              ],
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
                              color: HomeColor.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              size: screenSize.width * 0.07,
                              color: HomeColor.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -4,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(screenSize.width * 0.02),
                            decoration: BoxDecoration(
                              color: HomeColor.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              HomescreenText.cart,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.03,
                                color: HomeColor.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.025),
                Row(
                  children: [
                    Text(
                      HomescreenText.namegreet,
                      style: TextStyle(fontSize: screenSize.width * 0.04),
                    ),
                    Text(
                      HomescreenText.greeting,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.025),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/searchscreen');
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: HomescreenText.hint,
                        hintStyle: TextStyle(fontSize: screenSize.width * 0.04),
                        prefixIcon: Icon(
                          Icons.search,
                          size: screenSize.width * 0.05,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: HomeColor.fillsearch,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.02,
                          horizontal: screenSize.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.025),

                Row(
                  children: [
                    Text(
                      HomescreenText.allcategories,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      HomescreenText.seeall,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.035,
                        color: HomeColor.black,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.015),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: screenSize.width * 0.035,
                      color: HomeColor.grey,
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.015),
                SizedBox(
                  height: screenSize.height * 0.07,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: homescreen.homeScreenList.length,
                        separatorBuilder:
                            (_, __) =>
                                SizedBox(width: screenSize.width * 0.025),
                        itemBuilder: (context, index) {
                          bool isSelected =
                              index == homescreen.selectedCategoryIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                homescreen.selectedCategoryIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? HomeColor.amberall
                                        : HomeColor.grey100,
                                borderRadius: BorderRadius.circular(
                                  screenSize.width * 0.08,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenSize.width * 0.012,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        screenSize.width * 0.08,
                                      ),
                                      child: Image.asset(
                                        homescreen.homeScreenList[index].image,
                                        height: screenSize.height * 0.06,
                                        width: screenSize.height * 0.06,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: screenSize.width * 0.04,
                                      left: screenSize.width * 0.02,
                                    ),
                                    child: Text(
                                      homescreen.homeScreenList[index].name,
                                      style: TextStyle(
                                        fontSize: screenSize.width * 0.035,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: screenSize.height * 0.025),

                Row(
                  children: [
                    Text(
                      HomescreenText.restraunts,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      HomescreenText.seeall,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.035,
                        color: HomeColor.black,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.015),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: screenSize.width * 0.035,
                      color: HomeColor.grey,
                    ),
                  ],
                ),

                SizedBox(height: screenSize.height * 0.015),
                Card(
                  margin: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: screenSize.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(screenSize.width * 0.04),
                            bottom: Radius.circular(screenSize.width * 0.04),
                          ),
                          image: DecorationImage(
                            image: AssetImage(HomeImage.restaurant2),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        color: HomeColor.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height * 0.015,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                HomescreenText.restaurantname,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width * 0.04,
                                ),
                              ),
                              Text(
                                HomescreenText.menu,
                                style: TextStyle(
                                  color: HomeColor.grey,
                                  fontSize: screenSize.width * 0.035,
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.01),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: HomeColor.orange,
                                    size: screenSize.width * 0.05,
                                  ),
                                  SizedBox(width: screenSize.width * 0.01),
                                  Text(
                                    HomescreenText.rating,
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                    ),
                                  ),
                                  SizedBox(width: screenSize.width * 0.03),
                                  Icon(
                                    Icons.delivery_dining,
                                    color: HomeColor.orange,
                                    size: screenSize.width * 0.05,
                                  ),
                                  SizedBox(width: screenSize.width * 0.01),
                                  Text(
                                    HomescreenText.delivery,
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                    ),
                                  ),
                                  SizedBox(width: screenSize.width * 0.03),
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: HomeColor.orange,
                                    size: screenSize.width * 0.05,
                                  ),
                                  SizedBox(width: screenSize.width * 0.01),
                                  Text(
                                    HomescreenText.time,
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenSize.height * 0.015),
                Card(
                  margin: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: screenSize.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(screenSize.width * 0.04),
                            bottom: Radius.circular(screenSize.width * 0.04),
                          ),
                          image: DecorationImage(
                            image: AssetImage(HomeImage.restaurant2),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        color: HomeColor.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height * 0.015,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                HomescreenText.restaurant2name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width * 0.04,
                                ),
                              ),
                              Text(
                                HomescreenText.menu2,
                                style: TextStyle(
                                  color: HomeColor.grey,
                                  fontSize: screenSize.width * 0.035,
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.01),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: HomeColor.orange,
                                    size: screenSize.width * 0.05,
                                  ),
                                  SizedBox(width: screenSize.width * 0.01),
                                  Text(
                                    HomescreenText.rating2,
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                    ),
                                  ),
                                  SizedBox(width: screenSize.width * 0.03),
                                  Icon(
                                    Icons.delivery_dining,
                                    color: HomeColor.orange,
                                    size: screenSize.width * 0.05,
                                  ),
                                  SizedBox(width: screenSize.width * 0.01),
                                  Text(
                                    HomescreenText.delivery,
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                    ),
                                  ),
                                  SizedBox(width: screenSize.width * 0.03),
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: HomeColor.orange,
                                    size: screenSize.width * 0.05,
                                  ),
                                  SizedBox(width: screenSize.width * 0.01),
                                  Text(
                                    HomescreenText.time2,
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
