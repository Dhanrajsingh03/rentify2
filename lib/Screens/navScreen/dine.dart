import 'package:flutter/material.dart';

class Dine extends StatefulWidget {
  const Dine({super.key});

  @override
  State<Dine> createState() => _DineState();
}

class _DineState extends State<Dine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade700,
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
          'DineOut  ',
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
    );
  }
}
