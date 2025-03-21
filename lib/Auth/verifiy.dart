import 'package:flutter/material.dart';

import '../Screens/HomeScreens.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  // Controllers for OTP fields
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  // Function to handle OTP field focus
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'OTP Verification ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.airplane_ticket_rounded,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/otp.png', // Adjust the corner radius
                width: 400,
                height: 400,
                fit: BoxFit.cover, // Ensures the image fills the container
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter OTP Sent to your no. - ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "+91 XXXXXXXX11 ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // OTP field 1
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _controller1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        focusNode: _focusNode1,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            FocusScope.of(context).requestFocus(_focusNode2);
                          }
                        },
                      ),
                    ),
                    // OTP field 2
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _controller2,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        focusNode: _focusNode2,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            FocusScope.of(context).requestFocus(_focusNode3);
                          } else {
                            FocusScope.of(context).requestFocus(_focusNode1);
                          }
                        },
                      ),
                    ),
                    // OTP field 3
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _controller3,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        focusNode: _focusNode3,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            FocusScope.of(context).requestFocus(_focusNode4);
                          } else {
                            FocusScope.of(context).requestFocus(_focusNode2);
                          }
                        },
                      ),
                    ),
                    // OTP field 4
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _controller4,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        focusNode: _focusNode4,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            FocusScope.of(context).requestFocus(_focusNode3);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
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
                        MaterialPageRoute(builder: (context) => Homescreens()),
                      );
                    },
                    child: Text(
                      'Verify OTP  ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
