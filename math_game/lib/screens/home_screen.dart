// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('Hello'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome to AppName',
              //textAlign: TextAlign.center,
              style: TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                //fontFamily: 'Impact',
              ),
            ),
          ),
          SizedBox(height: 25), //adds empty space
          ElevatedButton(
            child: Text('BUTTON'),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.indigo,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(
                //color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              //respond to button press
            },
          )
        ],
      ),
    );
  }
}
