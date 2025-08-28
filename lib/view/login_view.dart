import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task1/controller/login_controller.dart';
import 'package:task1/constants/color/loginscreen.dart';
import 'package:task1/constants/text/loginscreen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final LoginController loginController = LoginController();

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: loginScreenColor.bg1,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.12),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.08),
                Text(
                  LoginScreenText.firsttitle,
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    color: loginScreenColor.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  LoginScreenText.subtitle,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: loginScreenColor.subheading,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: loginScreenColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LoginScreenText.emailtitle,
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.007),

                    TextFormField(
                      controller: loginController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: LoginScreenText.hinttextemail,
                        hintStyle: TextStyle(
                          color: loginScreenColor.hint,
                          fontSize: screenWidth * 0.035,
                        ),
                        filled: true,
                        fillColor: loginScreenColor.textfieldfillcolor,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.025,
                          horizontal: screenWidth * 0.04,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    Text(
                      LoginScreenText.passwordtitle,
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.007),

                    ValueListenableBuilder(
                      valueListenable: loginController.obscurePassword,
                      builder: (context, value, _) {
                        return TextFormField(
                          controller: loginController.passwordController,
                          obscureText: value,
                          decoration: InputDecoration(
                            hintText: LoginScreenText.hinttextpassword,
                            hintStyle: TextStyle(
                              color: loginScreenColor.hint,
                              fontSize: screenWidth * 0.035,
                            ),
                            filled: true,
                            fillColor: loginScreenColor.textfieldfillcolor,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.025,
                              horizontal: screenWidth * 0.04,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                                size: screenWidth * 0.06,
                              ),
                              onPressed: loginController.showPassword,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.028),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.06,
                              height: screenWidth * 0.06,
                              child: Checkbox(
                                value: loginController.rememberMe,
                                side: BorderSide(
                                  color: loginScreenColor.hint,
                                ),
                                onChanged: (value) {
                                  setState(
                                    () =>
                                        loginController.toggleRememberme(value),
                                  );
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              LoginScreenText.rememberme,
                              style: TextStyle(
                                color: loginScreenColor.hint,
                                fontSize: screenWidth * 0.035,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () => loginController.forgotPassword(context),
                            child: Text(
                              LoginScreenText.forgotpassword,
                              style: TextStyle(
                                color: loginScreenColor.forgotpasswordandbutton,
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.035,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.028),

                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.069,
                      child: ElevatedButton(
                        onPressed: () => loginController.loginButton(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: loginScreenColor.forgotpasswordandbutton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          LoginScreenText.buttonlogin,
                          style: TextStyle(
                            color: loginScreenColor.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                            fontSize: screenWidth * 0.038,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LoginScreenText.noaccount,
                          style: TextStyle(
                            color: loginScreenColor.or,
                            fontSize: screenWidth * 0.038,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.018),
                        GestureDetector(
                          onTap: () => loginController.signup(context),
                          child: Text(
                            LoginScreenText.signup,
                            style: TextStyle(
                              color: loginScreenColor.forgotpasswordandbutton,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 0.038,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),

                    Center(
                      child: Text(
                        LoginScreenText.or,
                        style: TextStyle(
                          color: loginScreenColor.or,
                          fontSize: screenWidth * 0.040,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.027),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          icon: FontAwesomeIcons.facebookF,
                          color: loginScreenColor.icon1,
                          onTap: () {},
                        ),
                        SizedBox(width: screenWidth * 0.07),
                        SocialButton(
                          icon: FontAwesomeIcons.twitter,
                          color: loginScreenColor.icon2,
                          onTap: () {},
                        ),
                        SizedBox(width: screenWidth * 0.07),
                        SocialButton(
                          icon: FontAwesomeIcons.apple,
                          color: loginScreenColor.icon3,
                          onTap: () {},
                        ),
                      ],
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

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: screenWidth * 0.075,
        backgroundColor: color,
        child: FaIcon(icon, color: loginScreenColor.white, size: screenWidth * 0.045),
      ),
    );
  }
}
