// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [TextButton(onPressed: () {}, child: const Text('Skip'))],
      ),
      body: Body(),
    );
  }
}
