import 'package:flutter/material.dart';

class BoldText {
  Widget getText(String string, double size) {
    return Text(
      string,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: size,
        color: Colors.black,
      ),
    );
  }
}
