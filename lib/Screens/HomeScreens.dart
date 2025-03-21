import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:rentify/Screens/navScreen/tickets.dart';
import 'package:rentify/Screens/testing.dart';
import 'package:rentify/testing/test.dart';

import 'account.dart';
import 'bottom.dart';
import 'notification.dart';

class Homescreens extends StatefulWidget {
  const Homescreens({super.key});

  @override
  State<Homescreens> createState() => _HomescreensState();
}

class _HomescreensState extends State<Homescreens>
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

  /// Function to simulate a page refresh
  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate loading delay
    setState(() {}); // Rebuild the page to simulate refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.blueAccent,
                weight: 50.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.blueAccent,
                weight: 50.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              accountName: Text('Shivang Joshi'),
              accountEmail: Text('mrshivangg01@gmail.com'),
              currentAccountPicture: CircleAvatar(
                foregroundImage: AssetImage('assets/user.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_added_outlined),
              title: Text('Bookings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.support_agent_rounded),
              title: Text('Support Desk'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('My Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          notchMargin: 5.0,
          shape: CircularNotchedRectangle(),
          color: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildBottomNavItem(Icons.home, 'Home'),
              _buildBottomNavItem(Icons.search, 'Search'),
              _buildBottomNavItem(Icons.newspaper, 'Bookings'),
              _buildBottomNavItem(Icons.account_circle, 'Profile'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Colors.black.withOpacity(0.5),
            transitionAnimationController: _animationController,
            builder: (BuildContext context) {
              return _buildBottomSheetContent();
            },
          );
        },
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: Colors.orange,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Icon(Icons.support_agent_rounded),
      ),

      /// Wrapped the `ListView` with `LiquidPullToRefresh`
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.blueAccent.shade100,
        height: 50.0,
        backgroundColor: Colors.white,
        showChildOpacityTransition: false,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 17.0,
                bottom: 2.0,
              ),
              child: Text(
                'Welcome , ',
                style: TextStyle(
                  color: Colors.orange.shade900,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 2.0,
                left: 17.0,
                bottom: 10.0,
              ),
              child: Text(
                'Mr. Shivang ',
                style: TextStyle(
                  color: Colors.blueAccent.shade700,
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0,
                ),
              ),
            ),

            // seach bar
            Padding(
              padding: const EdgeInsets.all(.0),
              child: ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                leading: Icon(
                  Icons.location_city,
                  color: const Color.fromARGB(255, 224, 20, 91),
                ),
                title: Text('Search Your Ideal Place '),
                trailing: Icon(Icons.search, color: Colors.black12),
                tileColor: Colors.grey.shade100,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AnimatedSearchBar();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper Widget for Bottom Navigation Items
  Widget _buildBottomNavItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  /// Helper Widget for Bottom Sheet Content
  Widget _buildBottomSheetContent() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset.zero,
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
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: MediaQuery.of(context).size.height / 3,
              child: ListView(
                children: [
                  _buildBottomSheetListTile(
                    Icons.support_agent_rounded,
                    'Support Executive',
                    'Contact Customer support',
                  ),
                  _buildBottomSheetListTile(
                    Icons.location_on_rounded,
                    'Track your Bus',
                    'Track your happiness to reach destination',
                  ),
                  _buildBottomSheetListTile(
                    Icons.newspaper_rounded,
                    'Your Tickets',
                    'View your booked tickets',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetListTile(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent.shade400),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.navigate_next),
      tileColor: Colors.grey.shade200,
      onTap: () {},
    );
  }
}
