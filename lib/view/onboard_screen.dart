import 'package:flutter/material.dart';           
import '../controller/onboard_screen.dart';   
import 'package:task1/constants/color/onboardscreen.dart';
import 'package:task1/constants/text/onboardscreen.dart';


class OnBoard extends StatefulWidget {
  const OnBoard({super.key});  

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final OnBoardController _controller = OnBoardController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: OnBoardScreenColors.screenbg,
      body: SafeArea( 
        child: Column(
          children: [
        
            SizedBox(
              height: screenHeight * 0.78,
              child: PageView.builder(
                controller: _controller.pageController, 
                itemCount: _controller.onBoardData.length, 
                onPageChanged: (index) {
                  
                  setState(() {
                    _controller.changeView(index, () {});
                  });
                },
                itemBuilder: (context, index) {
                  final data = _controller.onBoardData[index];

                  return Column(
                    children: [
                      SizedBox(height: screenHeight * 0.1), 
                      
                      
                      Container(
                        height: screenHeight * 0.39,
                        width: screenWidth * 0.66,
                        margin: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(data.image), 
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.05), 

                      
                      Text(
                        data.title,
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          color: OnBoardScreenColors.title,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.015), 

                      
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01,
                        ),
                        child: Text(
                          data.subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.040,
                            color: OnBoardScreenColors.subtitle,
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.04), 

                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_controller.onBoardData.length, (dotIndex) {
                          final isActive = _controller.currentPage == dotIndex;

                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.012,
                            ),
                            height: screenWidth * 0.028,
                            width: screenWidth * 0.028,
                            decoration: BoxDecoration(
                              color: isActive ? OnBoardScreenColors.activedots : OnBoardScreenColors.nonactivedots,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: screenHeight * 0.02), 

          
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                children: [
                  
                  if (!_controller.isLastpage())
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: OnBoardScreenColors.button,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          _controller.nextPage(() {
                            setState(() {});
                          });
                        },
                        child: Text(
                          OnBoardText.next,
                          style: TextStyle(
                            color: OnBoardScreenColors.buttontext,
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.042,
                          ),
                        ),
                      ),
                    ),

                  
                  if (_controller.isLastpage())
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: OnBoardScreenColors.button,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed:() => _controller.goToLoginPage(context),
                        child: Text(
                          OnBoardText.getstarted,
                          style: TextStyle(
                            color: OnBoardScreenColors.buttontext,
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.042,
                          ),
                        ),
                      ),
                    ),

                  SizedBox(height: screenHeight * 0.008), 

                  
                  if (!_controller.isLastpage())
                    TextButton(
                      onPressed: () {
                        _controller.skipToLastPage(); 
                      },
                      child: Text(
                        OnBoardText.skip,
                        style: TextStyle(
                          color: OnBoardScreenColors.skip,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.02), 
          ],
        ),
      ),
    );
  }
}
