import 'package:ecommerce/Contentpage.dart';
import 'package:ecommerce/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var data = await Hive.openBox('products');
  runApp(MaterialApp(
    home: Firstpage(),
    routes: {
      "/first": (context) => Firstpage(),
      "/content": (context) => Contentpage(),
    },
  ));
}
