import 'package:flutter/material.dart';
import 'package:nowapps_task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        canvasColor: Color(0xFFEAEFFB),
      ),
      home: Home(),
    );
  }
}
