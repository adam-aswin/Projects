import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:olx/homepage.dart';
import 'package:olx/loginpage.dart';
import 'package:olx/signuppage.dart';

void main() async {
  await Hive.initFlutter();
  var data = await Hive.openBox('mydata');
  runApp(MaterialApp(
    home: Loginpage(),
    routes: {
      "/login": (context) => Loginpage(),
      "/sign": (context) => Signuppage(),
      "/home": (context) => Homepage(),
    },
  ));
}
