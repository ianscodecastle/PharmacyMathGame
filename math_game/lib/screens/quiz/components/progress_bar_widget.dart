import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  const ProgressIndicatorWidget({Key? key, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
        value: value,
        backgroundColor: kPrimaryColor,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green));
  }
}
