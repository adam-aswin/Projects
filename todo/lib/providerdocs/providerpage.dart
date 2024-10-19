import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier{
  List task=[];

  void addData(data){
    task.add(data);
    notifyListeners();
    
  }
}