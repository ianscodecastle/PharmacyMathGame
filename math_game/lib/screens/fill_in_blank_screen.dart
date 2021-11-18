// ignore_for_file: prefer_const_constructors
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:core';
import 'dart:convert';

List answers = List.filled(5, null, growable: false);
// answers[0] = correct answer
// answers[1] = user input

class FillInBlankScreen extends StatelessWidget {
  const FillInBlankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fill in the Blank Question #1'),
        backgroundColor: kTransparent,
        elevation: 1,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: kPrimaryGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Fill in the blank description #1 where the correct answer is 1.23',
                //textAlign: TextAlign.center,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  //fontFamily: 'Impact',
                ),
              ),
            ),
            SizedBox(height: 25), //adds empty space

            TextField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  //icon: Icon(Icons.account_circle),
                  //fillColor: Colors.grey,
                  //filled: true,
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your answer'),
              onChanged: (String userAnswer) => checkAnswer(userAnswer),
            ),
            SizedBox(height: 15),
            ElevatedButton(
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.indigo,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                    //color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => {
                      if (checkChoice() == false)
                        {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                wrongAnswer(context),
                          )
                        }
                      else if (checkChoice() == true)
                        {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                rightAnswer(context),
                          )
                          //respond to button press
                        },
                    }),
          ],
        ),
      ),
    );
  }
}

void descriptions() {
  answers[0] = "1.23";
}

bool checkChoice() {
  if (answers[1] == answers[0]) {
    return true;
  } else {
    return false;
  }
}

AlertDialog wrongAnswer(BuildContext context) {
  descriptions();
  return AlertDialog(
    title: const Text(
      'You got it wrong!',
      textAlign: TextAlign.center,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.center,
    ),
    actions: <Widget>[
      Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                // textColor: Theme.of(context).primaryColor,
                child: const Text('Try again'),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                    //color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                )),
            SizedBox(width: 5, height: 5),
            TextButton(
              onPressed: () {},
              child: const Text('See why'),
              style: TextButton.styleFrom(
                primary: Colors.grey,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

AlertDialog rightAnswer(BuildContext context) {
  return AlertDialog(
    title: const Text(
      'You got it right!',
      textAlign: TextAlign.center,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    ),
    actions: <Widget>[
      Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Next Question'),
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            )),
      ),
    ],
  );
}

void checkAnswer(String userInput) {
  answers[1] = userInput;
}
