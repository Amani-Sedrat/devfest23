import 'package:flutter/material.dart';
import 'package:frontend/screens/ChatBotScreen.dart';
import 'package:frontend/screens/HomeScreen.dart';
import 'package:frontend/screens/StatScreen.dart';
import 'package:frontend/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: login());
  }
}
