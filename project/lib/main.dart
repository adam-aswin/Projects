import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/loginpage.dart';
import 'package:project/signuppage.dart';

void main() {
  runApp(
    MaterialApp(
      home: Loginpage(),
      routes: {
        "/login": (context) => Loginpage(),
        "/sign": (context) => Signuppage(),
        "/home": (context) => Homepage(),
      },
    ),
  );
}
