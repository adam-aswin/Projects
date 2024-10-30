import 'package:flutter/material.dart';
import 'package:project/MainPage.dart';
import 'package:project/homepage.dart';
import 'package:project/loginpage.dart';
import 'package:project/signuppage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: Mainpage(),
    ),
  );
}
