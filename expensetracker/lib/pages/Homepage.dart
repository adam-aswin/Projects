import 'package:flutter/material.dart';
import 'dart:math' as math;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();

  void addincome() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Income",
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "EXPENSE TRACKER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[800]),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: addincome,
                child: Text(
                  "Add Income",
                  style: TextStyle(
                    color: Colors.green[800],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Text(
                  "Statement",
                  style: TextStyle(
                    color: Colors.green[800],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 44),
        leading: IconButton(
          onPressed: () => scaffoldkey.currentState?.openDrawer(),
          icon: Container(
            height: 28,
            width: 28,
            child: Image.asset(
              "./lib/icons/multiply-sign.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              height: 200,
              decoration: BoxDecoration(
                border: BorderDirectional(
                    end: BorderSide(
                      color: Colors.green,
                      width: 1,
                    ),
                    start: BorderSide(
                      color: Colors.green,
                      width: 1,
                    )),
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 61, 61, 61),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_outward_rounded,
                                color: Colors.white54,
                                size: 23,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "spends",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              )
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Transform.rotate(
                                  angle: 180 * math.pi / 180,
                                  child: Icon(
                                    Icons.arrow_outward_rounded,
                                    size: 17,
                                    color: Colors.white54,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "income",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available Balance",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "0",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
