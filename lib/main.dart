import 'package:flutter/material.dart';
import 'home.dart';
// adb connect localhost:5555
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}