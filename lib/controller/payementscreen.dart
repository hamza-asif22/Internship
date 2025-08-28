import 'package:task1/constants/images/paymentscreen.dart';
import 'package:task1/model/payementscreen.dart';
import 'package:flutter/material.dart';

class PayementController {
  int selectedIndex = 0;

  final List<PayementModel> payementMethods = [
    PayementModel(name: 'Cash', icon: PaymentImage.cash1, icon2: PaymentImage.cash2),
    PayementModel(name: 'Visa', icon: PaymentImage.visa1, icon2: PaymentImage.visa2),
    PayementModel(name: 'MasterCard', icon: PaymentImage.master1, icon2: PaymentImage.master2),
    PayementModel(name: 'Paypal', icon: PaymentImage.paypal1, icon2: PaymentImage.paypal2),
  ];

  void selectMethod(int index) {
    selectedIndex = index;
  }

  PayementModel get selectedMethod => payementMethods[selectedIndex];
}
