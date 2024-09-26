import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:hive/hive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController income = TextEditingController();
  final _data = Hive.box('mydata');
  int value = 0;
  double value1 = 0;
  double value2 = 0;
  double sum = 0;
  List datas = [];
  Map? get;
  List values = [];
  String total = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    balance();
  }

  void saveData() {
    setState(() {
      if (income.text == "") {
        print("null");
      } else {
        if (_data.get('key') != null) {
          value = int.parse(_data.get('key'));
          value += int.parse(income.text);
          _data.put('key', value.toString());
        } else {
          _data.put('key', income.text);
        }
      }
      Navigator.pop(context);
    });
  }

  void getData() {
    if (_data.get('exponly') == null) {
      null;
    } else {
      total = _data.get('exponly');
    }
  }

  void balance() {
    value2 = double.parse(total);
    value1 = double.parse(_data.get('key'));
    sum = value1 - value2;
  }

  void addincome() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text(
              "ADD INCOME",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: TextField(
                controller: income,
                decoration: InputDecoration(
                  hintText: "Income",
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: saveData,
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
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
                    // fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                    fontFamily: "Protest",
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
                                total,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23),
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
                                  _data.get('key') == null
                                      ? "0"
                                      : _data.get('key'),
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
                            sum.toString(),
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
