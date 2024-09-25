import 'package:expensetracker/pages/homescreen.dart';
import 'package:expensetracker/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var data = await Hive.openBox('mydata');

  runApp(MaterialApp(
    home: Splashscreen(),
  ));
}
