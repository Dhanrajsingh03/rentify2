import 'package:flutter/material.dart';

import 'account.dart';
import 'bottom.dart';
import 'notification.dart';

class Homee extends StatelessWidget {
  const Homee({super.key});

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
                  MaterialPageRoute(
                    builder: (context) {
                      return NotificationPage();
                    },
                  ),
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
                  MaterialPageRoute(
                    builder: (context) {
                      return AccountPage();
                    },
                  ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_added_outlined),
              title: Text('Bookings'),
              onTap: () {
                Navigator.pop(context);
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
                  MaterialPageRoute(
                    builder: (context) {
                      return AccountPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Text(
                    'Home ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.airplane_ticket_rounded, color: Colors.white),
                  Text(
                    'Tickets ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.fastfood, color: Colors.white),
                  Text(
                    'DineOut  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings, color: Colors.white),
                  Text(
                    'Settings ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 17.0, bottom: 2.0),
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
            padding: const EdgeInsets.only(top: 2.0, left: 17.0, bottom: 10.0),
            child: Text(
              'Mr. Shivang ',
              style: TextStyle(
                color: Colors.blueAccent.shade700,
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
