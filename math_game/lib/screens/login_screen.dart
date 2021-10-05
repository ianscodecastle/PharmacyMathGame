// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:core';
import 'dart:convert';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

List arr = List.filled(5, null, growable: false);

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('Pharmacy Math Game'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Login',
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

          TextField(
            controller: usernameController,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(

                //fillColor: Colors.grey,
                //filled: true,
                //border: UnderlineInputBorder(),

                labelText: 'Enter your username'),
            onChanged: (String text) => checkUsername(text),
          ),
          TextField(
            controller: passwordController,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password'),
            onChanged: (String text) => checkPassword(text),
          ),
          SizedBox(height: 15),

          ElevatedButton(
            child: Text('Forgot password'),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.indigo,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              textStyle: TextStyle(
                //color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => {
              forgotPassword()
              //respond to button press
            },
          ),
          SizedBox(height: 15),
          ElevatedButton(
            child: Text('Login'),
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
              checkLogin()
              //respond to button press
            },
          )
        ],
      ),
    );
  }
}

void checkUsername(String text) {
  arr[0] = text;
}

void checkPassword(String text) {
  arr[1] = text;
}

void checkLogin() {
  if (arr[0] == "username" && arr[1] == "password") {
    print("correct login");
  } else {
    print("incorrect login");
  }
}

void forgotPassword() {
  print("TODO: create forget password functionalities");
}
