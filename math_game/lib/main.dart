// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ians App',
      theme: ThemeData(
        //primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      //backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: const Text(
            'Pharmacy Math Game',
          ),
          elevation: 0,
          backgroundColor: Color(0xFF1c3763)),
      body: Container(
        child: TextInputWidget(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xFF1c3763),
              Colors.grey,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello World!');
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({Key? key}) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Hello World!") {
      controller.clear();
      text = "Hey :)";
    }
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: this.controller,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 50,
            ),
            prefixIcon: Icon(Icons.computer_rounded, color: Colors.white),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(50.0),
            ),
            labelText: "",
          ),
          onChanged: (text) => this.changeText(text),
        ),
        Text(this.text)
      ],
    );
  }
}
