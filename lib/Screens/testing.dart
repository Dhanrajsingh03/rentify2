import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.blueGrey,
          child: Center(
            child: Text(
              'This is the modal bottom sheet!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modal Bottom Sheet Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openBottomSheet(context),
          child: Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}
