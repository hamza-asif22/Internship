import 'package:flutter/material.dart';
import 'package:task1/constants/color/payementsuccessscreen.dart';
import '../constants/text/payementsuccessscreen.dart';
import '../constants/images/payementsuccessscreen.dart';

class PayementSuccessScreen extends StatefulWidget {
  const PayementSuccessScreen({super.key});

  @override
  _PayementSuccessScreenState createState() => _PayementSuccessScreenState();
}

class _PayementSuccessScreenState extends State<PayementSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: PaymentSuccessColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight* 0.1),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    height: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(PayementSuccessImage.success),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    PayementSuccesssText.congrats,
                    style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w600,
                      color: PaymentSuccessColor.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    PayementSuccesssText.successMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      
                      fontWeight: FontWeight.w400,
                      color: PaymentSuccessColor.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 22),
            child: SizedBox(
              width: double.infinity,
              height: screenHeight * 0.075,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: PaymentSuccessColor.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  PayementSuccesssText.trackOrder,
                  style: TextStyle(
                    color: PaymentSuccessColor.white,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
