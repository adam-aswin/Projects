import 'package:flutter/material.dart';
import 'package:olx/loginpage.dart';
import 'package:olx/signuppage.dart';

void main() {
  runApp(MaterialApp(
    home: Loginpage(),
    routes: {
      "/login": (context) => Loginpage(),
      "/sign": (context) => Signuppage(),
    },
  ));
}
