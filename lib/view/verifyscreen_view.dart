import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  int _secondsRemaining = 60;
  bool _isResendAllowed = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isResendAllowed = false;
    _secondsRemaining = 60;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _isResendAllowed = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _resendCode() {
    if (_isResendAllowed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification Code Sent Again')),
      );
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 46),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.055),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: screenWidth * 0.045,
                        color: Colors.black54,
                      ),
                      onPressed:
                          () => Navigator.of(
                            context,
                          ).pushReplacementNamed('/forgotpassword'),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'We have sent a code to your email',
                  style: TextStyle(
                    fontSize: screenWidth * 0.038,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  'example@gmail.com',
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
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
                    Row(
                      children: [
                        Text(
                          'CODE',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: _isResendAllowed ? _resendCode : null,
                          child: Text.rich(
                            TextSpan(
                              children:
                                  _isResendAllowed
                                      ? [
                                        TextSpan(
                                          text: 'Resend Code',
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ]
                                      : [
                                        TextSpan(
                                          text: 'Resend ',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.black,
                                            decorationThickness: 1.2,
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'in$_secondsRemaining sec',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      autoDismissKeyboard: true,
                      enableActiveFill: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: screenHeight * 0.07,
                        fieldWidth: screenWidth * 0.13,
                        activeFillColor: const Color.fromARGB(
                          250,
                          240,
                          245,
                          250,
                        ),
                        inactiveFillColor: const Color.fromARGB(
                          250,
                          240,
                          245,
                          250,
                        ),
                        selectedFillColor: const Color.fromARGB(
                          250,
                          240,
                          245,
                          250,
                        ),
                        activeColor: const Color.fromARGB(250, 240, 245, 250),
                        selectedColor: const Color.fromARGB(250, 240, 245, 250),
                        inactiveColor: const Color.fromARGB(250, 240, 245, 250),
                      ),
                    ),

                    // SizedBox(height: screenHeight * 0.01),
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.065,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            118,
                            34,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'VERIFY',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
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
