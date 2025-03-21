import 'package:flutter/material.dart';

import 'Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          'Login  ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.account_circle, color: Colors.blueAccent),
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
                'Login to continue ',
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
                'Hearty welcome to you !  ',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                ),
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
                'Login ',
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
