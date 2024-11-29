import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mymessenger/Userprovider.dart';
import 'package:mymessenger/chatPage.dart';
import 'package:mymessenger/displayusers.dart';
import 'package:mymessenger/forgotpassword.dart';
// import 'package:mymessenger/homepage.dart';
import 'package:mymessenger/mainpage.dart';
import 'package:mymessenger/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  var box = await Hive.openBox('mydata');
  runApp(
    ChangeNotifierProvider(
        create: (context) => Userprovider(),
        child: MaterialApp(
          home: Mainpage(),
          routes: {
            "/sign": (context) => Signup(),
            "/main": (context) => Mainpage(),
            "/forgot": (context) => Forgotpassword(),
            "/details": (context) => Displayusers(),
            "/chat": (context) => Chatpage(),
          },
        )),
  );
}
