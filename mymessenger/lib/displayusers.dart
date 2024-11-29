import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mymessenger/Userprovider.dart';
import 'package:provider/provider.dart';

class Displayusers extends StatefulWidget {
  const Displayusers({super.key});

  @override
  State<Displayusers> createState() => _DisplayusersState();
}

class _DisplayusersState extends State<Displayusers> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('User_Details');
  List<Map<String, dynamic>> userlist = [];
  final mydata = Hive.box('mydata');
  String? sender;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  void getUsers() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('User_Details');
    QuerySnapshot querySnapshot = await users.get();

    setState(() {
      var data = mydata.get('sender');
      sender = data['uid'];
      userlist = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      for (Map use in userlist) {
        if (use['uid'] == sender) {
          userlist.remove(use);
          break;
        }
      }
    });

    print("-==============================");
    print(sender);
    print("-==============================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 228, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Select Contact",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: userlist.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (context, index) {
                  var user = userlist[index];
                  print("================================================");
                  // print(user['uid']);
                  // print(sender);
                  // user['uid'] == sender
                  //     ? print(userlist.remove(user))
                  //     : print("no");
                  print("================================================");

                  return ListTile(
                    title: Text(
                      user['user'] ?? 'No Username',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[400],
                      ),
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                    onTap: () {
                      Provider.of<Userprovider>(context, listen: false)
                          .setUid(user['uid'] ?? '');
                      var data = {"uid": user['uid'], "user": user['user']};
                      mydata.put('receiver', data);
                      print(mydata.get('receiver'));
                      Navigator.pushReplacementNamed(context, "/chat");
                    },
                  );
                },
              ));
  }
}
