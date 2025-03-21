import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomWidget extends StatelessWidget {
  // Future<void> _openMessagingApp() async {
  //   const smsUrl = 'sms:'; // This will open the default messaging app
  //   if (await canLaunch(smsUrl)) {
  //     await launch(smsUrl); // Opens the default messaging app
  //   } else {
  //     throw 'Could not open messaging app';
  //   }
  // }
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Lottie.asset(
                    'anim/help.json', // Path to your first Lottie animation
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Help Desk',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'We have sent a 4-Digit Confirmation code in the inbox of your message , Kindly Check and complete the verification ',
                  style: TextStyle(
                    color: Colors.blueAccent.shade200,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),

            // TextButton(
            //       onPressed: _openMessagingApp,
            //
            //         child: Text('If not done , open messaging app ' , style: TextStyle(color: Colors.black26 , fontWeight: FontWeight.w700 ,  ),),
            // ),
            SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80.0, right: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        side: BorderSide(width: 1.0, color: Colors.green),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          'Got it !',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}
