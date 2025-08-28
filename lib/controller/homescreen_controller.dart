import 'package:flutter/material.dart';
import 'package:task1/constants/images/homescreen.dart';
import 'package:task1/constants/text/homescreen.dart';
import '../model/homescreen_model.dart';
import 'package:task1/constants/color/homescreen.dart';

class HomescreenController {
  final List<HomescreenModel> homeScreenList = [
    HomescreenModel(image: HomeImage.all, name: HomescreenText.all),
    HomescreenModel(image: HomeImage.hotdog, name: HomescreenText.hotdog),
    HomescreenModel(image: HomeImage.burger, name: HomescreenText.burger),
  ];

  int selectedCategoryIndex = 0;

  void selectCategory(int index, VoidCallback updateUi) {
    selectedCategoryIndex = index;
    updateUi();
  }

  void showOfferPopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.1,
                  left: screenSize.width * 0.05,
                  right: screenSize.width * 0.05,
                  bottom: screenSize.height * 0.03,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(250, 255, 235, 52),
                      Color.fromARGB(250, 231, 111, 0),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      HomescreenText.offer,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.09,
                        fontWeight: FontWeight.bold,
                        color: HomeColor.white,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.05),
                    Text(
                      HomescreenText.code,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: HomeColor.white,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Text(
                      HomescreenText.description,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        color: HomeColor.white,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    SizedBox(
                      width: double.infinity,
                      height: screenSize.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: BorderSide(color: HomeColor.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          HomescreenText.button,
                          style: TextStyle(
                            color: HomeColor.white,
                            fontSize: screenSize.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 4,
                top: -12,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    radius: screenSize.width * 0.04,
                    child: Icon(
                      Icons.close,
                      size: screenSize.width * 0.045,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
