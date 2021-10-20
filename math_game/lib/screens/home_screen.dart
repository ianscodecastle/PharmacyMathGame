// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'login_screen.dart';

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
      body: Container(
        decoration: BoxDecoration(gradient: kPrimaryGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AlignedMainText(),
            SizedBox(height: 25), //adds empty space
            StartButton()
          ],
        ),
      ),
    );
  }
}

class AlignedMainText extends StatelessWidget {
  const AlignedMainText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Welcome to AppName',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kSecondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 40,
          //fontFamily: 'Impact',
        ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    );
  }
}
