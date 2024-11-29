import 'package:flutter/material.dart';
import 'package:mychat/loginpage.dart';
import 'package:mychat/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Loginpage(),
    routes: {
      "/sign": (context) => Signup(),
    },
  ));
}
