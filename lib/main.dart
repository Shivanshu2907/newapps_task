import 'package:flutter/material.dart';
import 'package:nowapps_task/screens/home_screen.dart';

void main() {
  runApp(const NowAppsTask());
}

class NowAppsTask extends StatelessWidget {
  const NowAppsTask({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NowApps Task',
      theme: ThemeData(
        canvasColor: const Color(0xFFEAEFFB),
      ),
      home: Home(),
    );
  }
}
