import 'package:appwrite_auth/homepage.dart';
import 'package:appwrite_auth/loginpage.dart';
import 'package:appwrite_auth/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/signup": (context) => Signup(),
      "/home": (context) => Homepage(),
      "/login": (context) => Loginpage(),
    },
    initialRoute: "/login",
  ));
}
