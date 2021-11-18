// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_game/screens/fill_in_blank_screen.dart';
import 'package:math_game/screens/multiple_choice_screen.dart';
import 'package:math_game/screens/quiz/quiz_screen.dart';
import 'package:math_game/screens/results_screen.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        //scaffoldBackgroundColor: Colors.indigo,
        //primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ResultScreen(),
    );
  }
}
