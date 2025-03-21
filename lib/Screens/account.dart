import 'package:flutter/material.dart';
import 'package:rentify/Screens/HomeScreens.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart'; // Add this import for refresh

import '../Auth/login.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call
    // ScaffoldMessenger.of(
    //   context,
    // ).showSnackBar(SnackBar(content: Text('Page Refreshed!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            weight: 20.0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Homescreens();
                },
              ),
            );
          },
        ),
        title: Text(
          'Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.blueAccent.shade100,
        backgroundColor: Colors.white,
        height: 60,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                radius: 90.0,
                foregroundImage: AssetImage('assets/user.png'),
                backgroundColor: Colors.grey[200],
              ),
            ),
            Center(
              child: Text(
                'Mr. Shivangg',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                leading: Icon(
                  Icons.verified_user_rounded,
                  color: Colors.green.shade400,
                ),
                title: Text('Your Info '),
                trailing: Icon(Icons.navigate_next),
                subtitle: Text('Click here to know info !'),
                tileColor: Colors.grey.shade100,
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(
                  Icons.monetization_on_rounded,
                  color: Colors.green.shade400,
                ),
                title: Text('Wallet '),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                trailing: Icon(Icons.navigate_next),
                subtitle: Text('Wallet Amount'),
                tileColor: Colors.grey.shade100,
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(
                  Icons.bookmark_added,
                  color: Colors.green.shade400,
                ),
                title: Text('My Bookings '),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                trailing: Icon(Icons.navigate_next),
                subtitle: Text('Your bookings'),
                tileColor: Colors.grey.shade100,
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                leading: Icon(
                  Icons.supervised_user_circle_rounded,
                  color: Colors.green.shade400,
                ),
                title: Text('Passengers '),
                trailing: Icon(Icons.navigate_next),
                subtitle: Text('Add New Passengers'),
                tileColor: Colors.grey.shade100,
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'More',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                leading: Icon(
                  Icons.discount_rounded,
                  color: Colors.green.shade400,
                ),
                title: Text('Offers'),
                trailing: Icon(Icons.navigate_next),
                subtitle: Text('Bombastic Offers '),
                tileColor: Colors.grey.shade100,
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                leading: Icon(
                  Icons.transcribe_rounded,
                  color: Colors.green.shade400,
                ),
                title: Text('Referral '),
                trailing: Icon(Icons.navigate_next),
                subtitle: Text('Refer to your friends '),
                tileColor: Colors.grey.shade100,
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                leading: Icon(Icons.history, color: Colors.green.shade400),
                title: Text('Know about BookMyTickets'),
                trailing: Icon(Icons.navigate_next),
                subtitle: Text('Interesting facts about us '),
                tileColor: Colors.grey.shade100,
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                leading: Icon(Icons.star_rate, color: Colors.green.shade400),
                title: Text('Rate Us on your Store '),
                trailing: Icon(Icons.navigate_next),
                subtitle: Text('Google play Store or App Store  '),
                tileColor: Colors.grey.shade100,
                onTap: () {},
              ),
            ),

            Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          elevation: 2.0,
                          minimumSize: Size(200, 50),
                          iconColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Logout  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
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
