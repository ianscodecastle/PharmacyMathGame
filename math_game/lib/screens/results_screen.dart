// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_game/screens/home_screen.dart';
import 'package:math_game/screens/multiple_choice_screen.dart';
import 'login_screen.dart';

String congrats = 'Good job!\n You got $score out of $totalQuestions correct!';
String tryHarder =
    'Better luck next time!\nYou got $score out of $totalQuestions correct!';
String logoutResponse = '';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        //title: const Text('Hello'),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
    if (score < 3) {
      logoutResponse = tryHarder;
    } else {
      logoutResponse = congrats;
    }
    return Align(
      alignment: Alignment.center,
      child: Text(
        logoutResponse,
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
    return Column(
      children: [
        ElevatedButton(
          child: Text('Play Again'),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Color(0xff355C7D),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(
              //color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            //respond to button press
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MultipleChoiceScreen()));
          },
        ),
        SizedBox(width: 10, height: 10),
        TextButton(
          child: Text('Log Out'),
          style: TextButton.styleFrom(
            primary: Colors.grey,
            //onPrimary: Color(0xff355C7D),
            padding: EdgeInsets.symmetric(horizontal: 58, vertical: 20),
            textStyle: TextStyle(
              //color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            //respond to button press
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ],
    );
  }
}
