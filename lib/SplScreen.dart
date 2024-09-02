import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'MainPage.dart';

class SplScreen extends StatefulWidget {
  @override
  _SplScreenState createState() => _SplScreenState();
}

class _SplScreenState extends State<SplScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const Text(
                  "Project Alpha",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/quran.jpg',
                  fit: BoxFit.fill,
                ),
              ],
            )),
      ),
    );
  }
}
