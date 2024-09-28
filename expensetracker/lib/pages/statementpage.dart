import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Statementpage extends StatefulWidget {
  const Statementpage({super.key});

  @override
  State<Statementpage> createState() => _StatementpageState();
}

class _StatementpageState extends State<Statementpage> {
  final _data = Hive.box('mydata');
  List datetime = [];
  Uint8List? image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    datetime = _data.get('exp');

    print(datetime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 44),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Statement",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: datetime.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 90,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[900],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              _data.get('exp') != null
                                  ? datetime[index]["day"]
                                  : null,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Protest",
                                fontSize: 36,
                              ),
                            ),
                            Text(
                              _data.get('exp') != null
                                  ? datetime[index]["mmyyyy"]
                                  : null,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Protest",
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 0,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          _data.get('exp') != null
                              ? datetime[index]["time"]
                              : null,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Protest",
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _data.get('exp') != null
                            ? datetime[index]["paid"]
                            : null,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Protest",
                        ),
                      ),
                      Divider(
                        height: 5,
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        "₹ ${_data.get('exp') != null ? datetime[index]["expense"] : null}",
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 90,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[600],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: datetime[index]["bill"] != null
                          ? Image.memory(
                              image = base64Decode(datetime[index]["bill"]),
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.insert_drive_file_outlined,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
