// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';
import 'package:flutter_svg/svg.dart';

List answers = List.filled(5, null, growable: false);
// answers[0] = correct answer
// answers[1] = multiple choice answer #1
// answers[2] = multiple choice answer #2
// answers[3] = multiple choice answer #3
// answers[4] = multiple choice answer #4

MaterialColor color = Colors.blue;

class MultipleChoiceScreen extends StatelessWidget {
  const MultipleChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    descriptions();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('Multiple Choice Question #1'),
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
        'Multiple choice description #1 where the correct answer is the third option',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kSecondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 25,
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
    return Container(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                primary: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              if (checkChoice(1) == false) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => wrongAnswer(context),
                );
              } else if (checkChoice(1) == true) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => rightAnswer(context),
                );
              }
            },
            child: Text(
              "Answer choice #1",
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                primary: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text("Answer choice #2"),
            onPressed: () {
              if (checkChoice(2) == false) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => wrongAnswer(context),
                );
              } else if (checkChoice(2) == true) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => rightAnswer(context),
                );
              }
            },
          ),
          SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                primary: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text("Answer choice #3"),
            onPressed: () {
              if (checkChoice(3) == false) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => wrongAnswer(context),
                );
              } else if (checkChoice(3) == true) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => rightAnswer(context),
                );
              }
            },
          ),
          SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                primary: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text("Answer choice #4"),
            onPressed: () {
              if (checkChoice(4) == false) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => wrongAnswer(context),
                );
              } else if (checkChoice(4) == true) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => rightAnswer(context),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

void descriptions() {
  answers[0] = "correct";
  answers[1] = "wrong";
  answers[2] = "wrong";
  answers[3] = "correct";
  answers[4] = "wrong";
}

bool checkChoice(int choice) {
  if (answers[choice] == answers[0]) {
    return true;
  } else {
    return false;
  }
}

AlertDialog wrongAnswer(BuildContext context) {
  return AlertDialog(
    title: const Text('You got it wrong!'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    actions: <Widget>[
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },

          // textColor: Theme.of(context).primaryColor,
          child: const Text('Try again'),
          style: ElevatedButton.styleFrom(
            primary: Colors.indigo,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(
              //color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          )),
      //),
    ],
  );
}

AlertDialog rightAnswer(BuildContext context) {
  return AlertDialog(
    title: const Text('You got it right!'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    actions: <Widget>[
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },

          // textColor: Theme.of(context).primaryColor,
          child: const Text('Next Question'),
          style: ElevatedButton.styleFrom(
            primary: Colors.indigo,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(
              //color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          )),
      //),
    ],
  );
}
