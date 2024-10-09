import 'package:ecommerce/Contentpage.dart';
import 'package:ecommerce/FirstPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Firstpage(),
    routes: {
      "/first":(context)=>Firstpage(),
      "/content":(context)=>Contentpage(),
    },
  ));
}
