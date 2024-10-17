import 'package:bloodbank/editpage.dart';
import 'package:bloodbank/pages/Addpage.dart';
import 'package:bloodbank/pages/Homepage.dart';
import 'package:bloodbank/pages/displaypage.dart';
import 'package:bloodbank/pages/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
    routes: {
      "/home": (context) => Homescreen(),
      "/home1": (context) => Homepage(),
      "/add": (context) => Addpage(),
      "/edit": (context) => Editpage(),
      "/display": (context) => Displaypage(),
    },
  ));
}
