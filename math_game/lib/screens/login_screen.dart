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

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

List arr = List.filled(3, null, growable: false);
// arr[0] = username
// arr[1] = password
// arr[2] = email

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: kPrimaryGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              onChanged: (String username) => checkUsername(username),
            ),
            TextField(
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your password'),
              onChanged: (String password) => checkPassword(password),
            ),
            SizedBox(height: 15),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Forgot password? ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                    text: 'Click here.',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              forgetPasswordDialog(context),
                        );
                        //),
                        //print('Login Text Clicked');
                      }),
              ]),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                    text: 'Create one here.',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("TODO: add create new account functionality");
                        //),
                        //print('Login Text Clicked');
                      }),
              ]),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              child: Text('Sign in'),
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
                checkLogin(),
                if (checkLogin() == false)
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          incorrectPassword(context),
                    )
                  }
                //respond to button press
              },
            ),
          ],
        ),
      ),
    );
  }
}

AlertDialog incorrectPassword(BuildContext context) {
  return AlertDialog(
    title: const Text('Incorrect username or password'),
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

AlertDialog forgetPasswordDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Enter in your email'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          //controller: passwordController,
          style: TextStyle(color: Colors.black),

          decoration: const InputDecoration(
              border: UnderlineInputBorder(), labelText: 'Enter your email'),
          onChanged: (String email) => saveEmail(email),
        ),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
          onPressed: () {
            sendEmail();
            Navigator.of(context).pop();
          },

          // textColor: Theme.of(context).primaryColor,
          child: const Text('Send new password'),
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

void saveEmail(String email) {
  arr[2] = email;
}

void sendEmail() {
  print("TODO: add send email and change password functionality");
}

void checkUsername(String username) {
  arr[0] = username;
}

void checkPassword(String password) {
  arr[1] = password;
}

bool checkLogin() {
  // TODO: connect to database and check login information
  if (arr[0] == "username" && arr[1] == "password") {
    print("correct login");
    return true;
  } else {
    print("incorrect login");
    return false;
  }
}

void forgotPassword() {
  print("TODO: create forget password functionalities");
}
