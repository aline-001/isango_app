import 'package:flutter/material.dart';
import 'screens/signup/signup_screen.dart';  // Import your signup screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isango App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: SignupScreen(),  
    );
  }
}