import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  TextEditingController _message = TextEditingController();
  final mydata = Hive.box('mydata');
  var data;
  String? receiver;
  String? sender;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> sendMessage(
      String sender, String receiver, String message) async {
    await FirebaseFirestore.instance.collection("Messages").add({
      "sender": sender,
      "receiver": receiver,
      "message": message.trim(),
      "timestamp": FieldValue.serverTimestamp(),
    });
    _message.clear();
  }

  void getData() {
    data = mydata.get('receiver');
    var sendermap = mydata.get('sender');
    sender = sendermap['uid'];
    print(sender);
    receiver = data['uid'];
    print(receiver);
    print(data);
  }

  Stream<QuerySnapshot> getMessage(String sender, String receiver) {
    return FirebaseFirestore.instance
        .collection("Messages")
        .where("sender", whereIn: [sender, receiver])
        .where("receiver", whereIn: [sender, receiver])
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            height: 50,
            width: 130,
            margin: EdgeInsets.only(
              right: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 0,
                  color: const Color.fromARGB(255, 71, 25, 150),
                  offset: Offset(5, 5),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_chat,
                    color: Colors.deepPurple,
                  ),
                ),
                VerticalDivider(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          )
        ],
        title: Text(
          data['user'],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            // flex: 6,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: StreamBuilder(
                stream: getMessage(sender!, receiver!),
                builder: (context, snapshot) {
                  print(snapshot.hasError);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text("Something went wrong"),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No message yet"),
                    );
                  }
                  print("===========================================");

                  print(snapshot.data!.docs);
                  final messages = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final messageData =
                          messages[index].data() as Map<String, dynamic>;
                      print("===========================================");
                      print(messageData);
                      print("===========================================");
                      final isSender = messageData["sender"] == sender;
                      return Align(
                        alignment: isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSender
                                ? Colors.deepPurple[300]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            messageData["message"],
                            style: TextStyle(
                              color: isSender ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .78,
                height: 48,
                margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                // padding: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic_none_rounded,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        controller: _message,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attachment_rounded,
                              color: Colors.deepPurple,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Let's talk",
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(13),
                  ),
                  onPressed: () {
                    if (_message.text != "") {
                      sendMessage(sender!, receiver!, _message.text);
                    }
                  },
                  child: Icon(
                    Icons.send_rounded,
                    size: 20,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
