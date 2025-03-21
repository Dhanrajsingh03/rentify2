import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rentify/Screens/bottom.dart';
import 'package:rentify/Screens/navScreen/home_page.dart';

import '../Screens/HomeScreens.dart';
import '../widgets/customWidgets.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Register ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/img.png', // Adjust the corner radius
                // child: Image.network(
                //   "https://media-hosting.imagekit.io//303bb433645240dd/IMG_20240623_083522_461.jpg?Expires=1835603724&Key-Pair-Id=K2ZIVPTIP2VGHC&Signature=e4s7QhhXXXhAQLTt52-xQaqBnIkF8N7XJBWTDGelUqKFYf0Sq7gRs9zbqytYTHsGFCtXQWc013-EIrNlzgGYi0f10VVUOaoKduDtgCSltMjMHslkhJnuQjPhSYhuBdX-2KfP~jalwD~5XkbrOJfXAkeDWvMmWlEyUlof9gDxHC~TkB0UOxCETUhRsMxrArGYKxOH2IaFfuL5qMiKtQWXqIYT3v0nAMXlfQNhqDI9UvV1rVlUo2TXOMTN3fdmvVf5xH7o-vQEgzpizneKpQhM8UfNm2vYYLXoZ53YQs9qY3uW90YFrGxprX03cOBi3QCznJbx5LM189kWKXyd~5vGRA__",
                width: 400,
                height: 400,
                fit: BoxFit.cover, // Ensures the image fills the container
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 15.0,
              right: 15.0,
              bottom: 5.0,
            ),
            child: Center(
              child: Text(
                'Register here to continue ',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Center(
              child: Text(
                'We are honor for your support and appreciation  ',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Your Name',
                prefixIcon: Icon(Icons.verified_user, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                helperText: 'e.g - Pawan Kumar',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              left: 15.0,
              right: 15.0,
              bottom: 10.0,
            ),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Your Mobile Number',
                prefixIcon: Icon(Icons.phone, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                helperText: 'e.g - xxxxxxxxx0',
                prefixText: '+91 ',
              ),
            ),
          ),

          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text(
              'Already have a account ? Login here !',
              style: TextStyle(color: Colors.orange),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
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
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(height: 400, child: bottomSheet());
                  },
                );
              },
              child: Text(
                'Get OTP  ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class bottomSheet extends StatefulWidget {
  const bottomSheet({super.key});

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

  // Define FocusNodes for each OTP field
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    // Dispose FocusNodes to avoid memory leaks
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    child: IconButton(
                      icon: Icon(
                        Icons.question_mark_sharp,
                        size: 22.0,
                        color: Colors.black,
                        weight: 700,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CustomWidget(),
                        );
                      },
                    ),
                  ),
                  Icon(Icons.horizontal_rule, size: 40.0),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.xmark,
                      size: 22.0,
                      weight: 700,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              'OTP Verification',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 10.0,
                bottom: 0.0,
              ),
              child: Text(
                'We have sent a 4-Digit Confirmation code on your mobile no.   ',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Enter the One Time Password  ',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),

          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _otpTextField(_otpController1, _focusNode1, _focusNode2, context),
              SizedBox(width: 10),
              _otpTextField(_otpController2, _focusNode2, _focusNode3, context),
              SizedBox(width: 10),
              _otpTextField(_otpController3, _focusNode3, _focusNode4, context),
              SizedBox(width: 10),
              _otpTextField(_otpController4, _focusNode4, null, context),
            ],
          ),

          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(25.0),
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
    );
  }
}

Widget _otpTextField(
  TextEditingController controller,
  FocusNode focusNode,
  FocusNode? nextFocusNode,
  BuildContext context, // Add context as a parameter
) {
  return SizedBox(
    width: 50,
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration: InputDecoration(
        counterText: "",
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (value.length == 1 && nextFocusNode != null) {
          // Move to the next field when the user enters a value
          FocusScope.of(
            context,
          ).requestFocus(nextFocusNode); // Now we can use context here
        }
      },
    ),
  );
}
