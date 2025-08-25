import 'package:flutter/material.dart';
import 'package:task1/model/onboard_screen.dart';
import 'package:task1/constants/images/onboardscreen.dart';
import 'package:task1/constants/text/onboardscreen.dart';

class OnBoardController {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<OnBoardModel> onBoardData = [
    OnBoardModel(
      image: OnBoardScreenimage.onb1,
      title: OnBoardText.title1,
      subtitle: OnBoardText.subtitle,
    ),
    OnBoardModel(
      image: OnBoardScreenimage.onb2,
      title: OnBoardText.title1,
      subtitle: OnBoardText.subtitle,
    ),
    OnBoardModel(
      image: OnBoardScreenimage.onb3,
      title: OnBoardText.title2,
      subtitle: OnBoardText.subtitle,
    ),
    OnBoardModel(
      image: OnBoardScreenimage.onb4,
      title: OnBoardText.title3,
      subtitle: OnBoardText.subtitle,
    ),
  ];

  void nextPage(VoidCallback setStateCallback) {
    if (currentPage < onBoardData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
    setStateCallback();
  }

  void changeView(int index, VoidCallback setStateCallback) {
    currentPage = index;
    setStateCallback();
  }

  void goToLoginPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void skipToLastPage() {
    pageController.jumpToPage(onBoardData.length - 1);
  }

  bool isLastpage() => currentPage == onBoardData.length - 1;
}
