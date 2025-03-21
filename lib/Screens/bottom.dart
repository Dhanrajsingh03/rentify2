import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cool Bottom Sheet Animation')),
      body: Center(child: Text('Click the FAB to open the bottom sheet')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Colors.black.withOpacity(0.5),
            transitionAnimationController: _animationController,
            builder: (BuildContext context) {
              return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 1), // Start from bottom
                      end: Offset.zero, // End at normal position
                    ).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: ScaleTransition(
                      scale: Tween(begin: 0.1, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height / 3,
                        child: Center(
                          child: Text(
                            'This is the Bottom Sheet!',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Custom widget for the dismiss button outside the container
  Widget dismissButton(BuildContext context) {
    return Positioned(
      top: -20, // Position it above the container
      left: MediaQuery.of(context).size.width / 2 - 30, // Center horizontally
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop(); // Close the bottom sheet
        },
        child: CircleAvatar(
          radius: 25, // Circular background size
          backgroundColor: Colors.white,
          child: Icon(Icons.close, color: Colors.black, size: 30),
        ),
      ),
    );
  }
}
