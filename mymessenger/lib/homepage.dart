import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> userlist = [];
  List<Map<String, dynamic>> messagelist = [];
  List<Map<String, dynamic>> userOGlist = [];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final mydata = Hive.box('mydata');
  String? sender;
  List<Map<String, dynamic>> userss = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getUsers();
  }

  void getUsers() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('User_Details');
    CollectionReference message =
        FirebaseFirestore.instance.collection('Messages');
    QuerySnapshot querySnapshot = await users.get();
    QuerySnapshot querySnapshot1 = await message.get();

    setState(() {
      var data = mydata.get('sender');
      sender = data['uid'];
      userlist = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      messagelist = querySnapshot1.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      for (Map<String, dynamic> user in userlist) {
        for (Map msg in messagelist) {
          if (user['uid'] == msg['receiver'] && sender != msg['receiver']) {
            userOGlist.add(user);
          }
          // print(msg);
        }
      }
      userss = userOGlist.toSet().toList();
    });

    print("==============================");

    print(userss);
    print("==============================");
  }

  Future logout() async {
    final googleSignIn = GoogleSignIn();
    try {
      if (await googleSignIn.isSignedIn()) {
        await FirebaseAuth.instance.signOut();
        await googleSignIn.signOut();
        if (await googleSignIn.isSignedIn()) {
          await googleSignIn.disconnect();
        } else {
          print("User not signed In");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 238, 228, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Messenger",
          style: TextStyle(
            // fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          style: IconButton.styleFrom(),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        ),
        actions: [],
        bottom: TabBar(
          controller: _tabController,
          dividerColor: const Color.fromARGB(255, 238, 228, 255),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.deepPurple,
          ),
          tabs: [
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.chat,
                    size: 16,
                  ),
                  Text("Chats"),
                ],
              ),
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.group,
                    size: 16,
                  ),
                  Text("Groups"),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 238, 228, 255),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: DrawerHeader(
                child: Text(""),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: logout,
                  icon: Icon(Icons.logout),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("Logout"),
              ],
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Colors.deepPurple,
            padding: EdgeInsets.only(bottom: 20, right: 20),
            child: Column(
              children: [
                Expanded(
                    child: userss.isEmpty
                        ? Center(
                            child: Text("No messages yet"),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.only(top: 20),
                            itemCount: userss.length,
                            itemBuilder: (context, index) {
                              var user = userss[index];
                              print(
                                  "================================================");
                              // print(user['uid']);
                              // print(sender);
                              // user['uid'] == sender
                              //     ? print(userlist.remove(user))
                              //     : print("no");
                              print(
                                  "================================================");

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
                                  var data = {
                                    "uid": user['uid'],
                                    "user": user['user']
                                  };
                                  mydata.put('receiver', data);
                                  print(mydata.get('receiver'));
                                  Navigator.pushNamed(context, "/chat");
                                },
                              );
                            },
                          )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/details");
                        },
                        child: Icon(Icons.message),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text("Groups"),
          ),
        ],
      ),
    );
  }
}
