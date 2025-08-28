import 'package:flutter/material.dart';
import 'package:task1/constants/text/paymentscreen.dart';
import 'package:task1/controller/cart_controller.dart';
import 'package:task1/controller/payementscreen.dart';
import 'package:task1/constants/color/paymentscreen.dart';

class PayementScreen extends StatefulWidget {
  const PayementScreen({super.key});

  @override
  State<PayementScreen> createState() => _PayementScreenState();
}

class _PayementScreenState extends State<PayementScreen> {
  final cartControl = CartController();
  final PayementController _controller = PayementController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final selectedMethod = _controller.selectedMethod;

    return Scaffold(
      backgroundColor: PaymentColor.white,
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          children: [
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.062),

                    
                    Row(
                      children: [
                        Container(
                          width: width * 0.09,
                          height: width * 0.09,
                          decoration: BoxDecoration(
                            color: PaymentColor.grey200,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: width * 0.045,
                              color: PaymentColor.black,
                            ),
                            onPressed:
                                () => Navigator.of(
                                  context,
                                ).pushReplacementNamed('/cartscreen'),
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        Text(
                          PaymentText.payment,
                          style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w400,
                            color: PaymentColor.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.03),

                   
                    SizedBox(
                      height: height * 0.12,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _controller.payementMethods.length,
                        itemBuilder: (context, index) {
                          final method = _controller.payementMethods[index];
                          final isSelected = index == _controller.selectedIndex;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _controller.selectMethod(index);
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.02,
                                      ),
                                      width: width * 0.22,
                                      height: width * 0.18,
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? PaymentColor.transparent
                                                : PaymentColor.fill,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color:
                                              isSelected
                                                  ? PaymentColor.isSelected
                                                  : PaymentColor.transparent,
                                          width: 2,
                                        ),
                                      ),
                                      child: Center(
                                      child: Image.asset(
                                        method.icon,
                                        width: width * 0.09,
                                        height: width * 0.09,
                                        fit: BoxFit.contain,
                                      ),
                                      ),
                                    ),
                                    if (isSelected)
                                      Positioned(
                                        top: -4,
                                        right: 10,
                                        child: Container(
                                          width: width * 0.05,
                                          height: width * 0.05,
                                          decoration: BoxDecoration(
                                            color: PaymentColor.isSelected,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: PaymentColor.white,
                                              width: 2,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            size: width * 0.035,
                                            color: PaymentColor.white,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: height * 0.005),
                                Text(
                                  method.name,
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: PaymentColor.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: height * 0.028),

                    
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: PaymentColor.border2,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(selectedMethod.icon2, width: width * 0.4),
                          SizedBox(height: height * 0.015),
                          Text(
                            selectedMethod.name == "Cash"
                                ? PaymentText.cod
                                : "No ${selectedMethod.name} Card Added",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height * 0.016),
                          Text(
                            PaymentText.subheading,
                            style: TextStyle(
                              fontSize: width * 0.037,
                              letterSpacing: width*0.004,
                              color: PaymentColor.grey600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      
                      ),
                      
                    ),

                    SizedBox(height: height * 0.025),

                    
                    if (selectedMethod.name == "Visa" ||
                        selectedMethod.name == "MasterCard" ||
                        selectedMethod.name == "Paypal")
                      SizedBox(
                        width: double.infinity,
                        height: height * 0.072,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed('/addcardscreen');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PaymentColor.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: PaymentColor.grey300,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: width * 0.065,
                                color: PaymentColor.isSelected,
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                PaymentText.addNew,
                                style: TextStyle(
                                  color: PaymentColor.isSelected,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                  fontSize: width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.015,
                vertical: height * 0.02,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        PaymentText.total,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: PaymentColor.grey400,
                          fontSize: width * 0.045,
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                      Text(
                        "\$${cartControl.totalSum.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.06,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.028),
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed('/paymentsuccessscreen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PaymentColor.isSelected,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        PaymentText.paybutton,
                        style: TextStyle(
                          color: PaymentColor.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          fontSize: width * 0.035,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
