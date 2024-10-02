import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newproject/HomePage.dart';

void main() async {
  await Hive.initFlutter();
  var data = await Hive.openBox('coffees');
  runApp(MaterialApp(
    home: Homepage(),
  ));
}
