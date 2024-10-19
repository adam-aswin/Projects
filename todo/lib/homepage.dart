import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providerdocs/providerpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, TaskProviderModal, child) => Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Home",style: TextStyle(color: Colors.white,),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, "/add");
          }, icon: Icon(Icons.add,color: Colors.white,)
          )
        ],
      ),
      body: ListView.builder(
        itemCount: TaskProviderModal.task.length,
        itemBuilder: (context, index) {
        return ListTile(
          onLongPress: () {
           showDialog(context: context, builder: (BuildContext context) {
             return AlertDialog(
              backgroundColor: Colors.grey[900],
              content: Text("Do You Want to Delete ?",style: TextStyle(color: Colors.white),),
              actions: [
                TextButton(onPressed: () {
                  setState(() {
              TaskProviderModal.task.removeAt(index);
              Navigator.pop(context);
           });
                }, child: Text("Ok",style: TextStyle(color: Colors.blueAccent),),
                ),
                TextButton(onPressed: () {
                  setState(() {
              Navigator.pop(context);
           });
                }, child: Text("Cancel",style: TextStyle(color: Colors.blueAccent),),
                ),
              ],
             );
           },);
          },
          title: Text("${TaskProviderModal.task[index]}",style: TextStyle(color: Colors.white,),),
          trailing: IconButton(onPressed: () {
            Navigator.pushNamed(context, "/edit",arguments: index.toString());
          }, icon: Icon(Icons.edit,color: Colors.blue,size: 18,)),
        );
      },),
    ),);
  }
}