import 'package:flutter/material.dart';
import 'package:zoo/homeScreen.dart';

void main() {
  runApp(applications());
}

class applications extends StatelessWidget {
  const applications({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
