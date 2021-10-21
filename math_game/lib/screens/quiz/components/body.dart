//the body of the quiz screen
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
            child:
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0))),
        Container(
          decoration: BoxDecoration(gradient: kPrimaryGradient),
        ),
        Container(
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(50),
          ),
        )
      ],
    );
  }
}
