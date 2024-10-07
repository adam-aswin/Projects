import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passwordhashing/pages/homepage.dart';
import 'package:passwordhashing/pages/loginpage.dart';
import 'package:passwordhashing/pages/signup.dart';

void main() async {
  await Hive.initFlutter();
  var data = await Hive.openBox('loginkey');
  runApp(MaterialApp(
    initialRoute: "/login",
    routes: {
      "/login": (context) => Loginpage(),
      "/sign": (context) => Signup(),
      "/home": (context) => Homepage(),
    },
  ));
}
