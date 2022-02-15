import 'package:flutter/material.dart';

class LightText {
  Widget getText(
      {required String string,
      required double size,
      Color color = Colors.grey}) {
    return Text(
      string,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: size,
        color: color,
      ),
    );
  }
}
