import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rentify/Screens/bottom.dart';

import '../Auth/Register.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Lottie Animation Controller
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Register();
                    },
                  ),
                );
              },
              child: Text('Skip', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // PageView with onboarding screens
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildOnboardingScreen(
                  'anim/fir.json', // Lottie animation asset for screen 1
                  'Discover Rooms ',
                  'Find cozy room ,modern flats , and perfect stays tailored to your needs',
                  Colors.white,
                ),
                _buildOnboardingScreen(
                  'anim/bookings.json', // Lottie animation asset for screen 2
                  'Easy Bookings',
                  'Seamlessly book your ideal place with just a few taps',
                  Colors.white,
                ),
                _buildOnboardingScreen(
                  'anim/pay.json', // Lottie animation asset for screen 3
                  'Secure Payments ',
                  'Fast , Safe and hassle-free payments for all your bookings ',
                  Colors.white,
                ),
              ],
            ),
          ),

          // Skip Button at the top right
          // Positioned(
          //   top: 40,
          //   right: 20,
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(builder: (context) => Register()),
          //       );
          //     },
          //     child: Text(
          //       'SKIP',
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black54,
          //       ),
          //     ),
          //   ),
          // ),

          // Dot Indicator at the bottom left
          Positioned(
            bottom: 40,
            left: 20,
            child: Row(
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 10,
                  width: _currentPage == index ? 24 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                );
              }),
            ),
          ),

          // Next Button at the bottom right
          Positioned(
            bottom: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (_currentPage == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _currentPage == 2 ? 'Get Started' : '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingScreen(
    String lottieAsset,
    String title,
    String description,
    Color color,
  ) {
    return Container(
      color: color,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Lottie animation in the center
          Lottie.asset(
            lottieAsset,
            width: 400,
            height: 400,
            controller: _animationController,
            onLoaded: (composition) {
              _animationController.forward();
            },
          ),
          SizedBox(height: 20),
          // Text below the animation
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 18, color: Colors.black26),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Screen')),
      body: Center(child: Text('You have completed the onboarding!')),
    );
  }
}
