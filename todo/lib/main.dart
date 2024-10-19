import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/AddTaskpage.dart';
import 'package:todo/Editpage.dart';
import 'package:todo/homepage.dart';
import 'package:todo/providerdocs/providerpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
    home: Homepage(),
    routes: {
      "/home":(context)=> Homepage(),
      "/add":(context)=> Addtaskpage(),
      "/edit":(context)=> Editpage(),
    },
  ),
    )
  );
}

