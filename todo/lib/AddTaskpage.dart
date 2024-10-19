import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providerdocs/providerpage.dart';

class Addtaskpage extends StatefulWidget {
  const Addtaskpage({super.key});

  @override
  State<Addtaskpage> createState() => _AddtaskpageState();
}

class _AddtaskpageState extends State<Addtaskpage> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, TaskProviderModal, child)=>Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Add Task",style: TextStyle(color: Colors.white,),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width*.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[800],

              ),
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blueAccent,width: 2)
                  )
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blueAccent[400]
              ),
              onPressed: () {
              if(controller.text!=""){
                TaskProviderModal.task.add(controller.text);
                Navigator.pushNamedAndRemoveUntil(context, "/home", (route)=>false);
              }
            }, 
            child: Text("ADD",style: TextStyle(color: Colors.black),),)
          ],
        ),
      ),
    ) ,);
  }
}