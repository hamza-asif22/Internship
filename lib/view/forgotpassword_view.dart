import 'package:flutter/material.dart';
import 'package:task1/controller/forgotpassword_controller.dart';
import 'package:task1/constants/color/forgotpasswordscreen.dart';
import 'package:task1/constants/text/forgotpasswordscreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final fpcontroller = ForgotPasswordController();

  @override
  void dispose() {
    fpcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ForgotPasswordColor.bg1,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.08),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      color: ForgotPasswordColor.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: screenWidth * 0.04,
                        color: ForgotPasswordColor.black,
                      ),
                      onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                Text(
                  ForgotPasswordText.forgotpassword,
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    color: ForgotPasswordColor.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  ForgotPasswordText.subheading,
                  style: TextStyle(
                    fontSize: screenWidth * 0.038,
                    color: ForgotPasswordColor.subheading,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.07),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ForgotPasswordColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ForgotPasswordText.email,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.008),
                    TextFormField(
                      controller: fpcontroller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: ForgotPasswordText.hint,
                        hintStyle: TextStyle(
                          color: ForgotPasswordColor.email,
                          fontSize: screenWidth * 0.037,
                        ),
                        filled: true,
                        fillColor: ForgotPasswordColor.fillcolor,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.04,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.065,
                      child: ElevatedButton(
                        onPressed: () => fpcontroller.verifybutton(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ForgotPasswordColor.button,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                            ForgotPasswordText.sendcode,
                          style: TextStyle(
                            color: ForgotPasswordColor.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
