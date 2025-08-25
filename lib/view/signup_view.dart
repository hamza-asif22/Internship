import 'package:flutter/material.dart';
import 'package:task1/constants/color/signup_screen.dart';
import 'package:task1/controller/signup_controller.dart';
import 'package:task1/view/login_view.dart';
import '../constants/text/signupscreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignupController signup = SignupController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SignupColor.bg1,
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.04),
          Center(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.06),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                        decoration: BoxDecoration(
                          color: SignupColor.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: screenWidth * 0.045,
                            color: SignupColor.black,
                          ),
                          onPressed:
                              () => Navigator.of(
                                context,
                              ).pushReplacementNamed('/login'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    SignupText.heading,
                    style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.bold,
                      color: SignupColor.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    SignupText.subheading,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: SignupColor.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: SignupColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(screenWidth * 0.055),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SignupText.name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    TextFormField(
                      controller: signup.namecontroller,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: SignupText.hintname,
                        hintStyle: TextStyle(
                          color: SignupColor.hint,
                          fontSize: screenWidth * 0.037,
                        ),
                        filled: true,
                        fillColor: SignupColor.fill,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.025,
                          horizontal: screenWidth * 0.04,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      SignupText.email,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    TextFormField(
                      controller: signup.emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: SignupText.hintemail,
                        hintStyle: TextStyle(
                          color: SignupColor.hint,
                          fontSize: screenWidth * 0.037,
                        ),
                        filled: true,
                        fillColor: SignupColor.fill,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.025,
                          horizontal: screenWidth * 0.04,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      SignupText.password,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ValueListenableBuilder(
                      valueListenable: signup.obscurepassword,
                      builder: (context, value, _) {
                        return TextFormField(
                          controller: signup.passwordcontroller,
                          obscureText: value,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: SignupColor.fill,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.025,
                              horizontal: screenWidth * 0.04,
                            ),
                            hintText: SignupText.hintpassword,
                            hintStyle: TextStyle(
                              color: SignupColor.hint,
                              fontSize: screenWidth * 0.037,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                                size: screenWidth * 0.06,
                              ),
                              onPressed: signup.showPassword,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      SignupText.confirmpassword,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ValueListenableBuilder(
                      valueListenable: signup.confirmpasswordobscure,
                      builder: (context, value, _) {
                        return SizedBox(
                          width: double.infinity,
                          height: screenHeight * 0.075,
                          child: TextFormField(
                            controller: signup.confirmpasswordcontroller,
                            obscureText: value,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: SignupColor.fill,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.025,
                                horizontal: screenWidth * 0.04,
                              ),
                              hintText: SignupText.hintpassword,
                              hintStyle: TextStyle(
                                color: SignupColor.hint,
                                fontSize: screenWidth * 0.037,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: screenWidth * 0.06,
                                ),
                                onPressed: signup.showConfirmPassword,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.075,
                      child: ElevatedButton(
                        onPressed: () => signup.signup(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: SignupColor.button,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          SignupText.button,
                          style: TextStyle(
                            color: SignupColor.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                            fontSize: screenWidth * 0.045,
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
