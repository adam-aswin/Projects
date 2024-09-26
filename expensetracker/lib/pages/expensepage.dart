import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class Expensepage extends StatefulWidget {
  const Expensepage({super.key});

  @override
  State<Expensepage> createState() => _ExpensepageState();
}

class _ExpensepageState extends State<Expensepage> {
  final _data = Hive.box('mydata');
  TextEditingController expense = TextEditingController();
  TextEditingController paid = TextEditingController();
  int value = 0;
  List data = [];
  DateTime current_time = DateTime.now();
  File? _image;
  String? base;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void gallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.pop(context);
      } else {
        print("null");
      }
    });
  }

  void pickimage() async {
    if (_image == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 247, 230, 230),
              title: Text(
                "Choose a File",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                TextButton(
                  onPressed: gallery,
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.blueAccent[700]),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.blueAccent[700]),
                  ),
                ),
              ],
            );
          });
    } else {
      print("null");
    }
  }

  void getData() {
    if (_data.get('exp') == null) {
      null;
    } else {
      data = _data.get('exp');
    }
  }

  void expensedata() {
    setState(() {
      if (_data.get('exponly') != null) {
        value = int.parse(_data.get('exponly'));
        value += int.parse(expense.text);
        _data.put('exponly', value.toString());
      } else {
        _data.put('exponly', expense.text);
      }
    });
  }

  void saveData() async {
    if (_image != null) {
      final bytes = await _image!.readAsBytes();
      final base64img = base64Encode(bytes);
      base = base64img;
    }
    setState(() {
      if (_data.get('exp') != null) {
        data = _data.get('exp');
        data.add(
          {
            "expense": expense.text,
            "paid": paid.text,
            "bill": base,
            "date":
                "${current_time.day.toString().padLeft(2, "0")}-${current_time.month.toString().padLeft(2, "0")}-${current_time.year}",
            "time":
                "${current_time.hour.toString().padLeft(2, "0")}:${current_time.minute.toString().padLeft(2, "0")}"
          },
        );
        _data.put('exp', data);
      } else {
        data = [
          {
            "expense": expense.text,
            "paid": paid.text,
            "bill": base,
            "date":
                "${current_time.day.toString().padLeft(2, "0")}-${current_time.month.toString().padLeft(2, "0")}-${current_time.year}",
            "time":
                "${current_time.hour.toString().padLeft(2, "0")}:${current_time.minute.toString().padLeft(2, "0")}"
          },
        ];
        _data.put('exp', data);
      }
    });
    Navigator.pop(context);
    expensedata();
  }

  void expenseAdd() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text(
              "ADD EXPENSE",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Container(
              height: 280,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      controller: expense,
                      decoration: InputDecoration(
                        hintText: "Expense",
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      controller: paid,
                      decoration: InputDecoration(
                        hintText: "Paid to",
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 15, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Bill",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 17),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: pickimage,
                          icon: Icon(Icons.add_circle_outline),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 70,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      color: Colors.grey,
                    ),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Icon(Icons.insert_drive_file_outlined),
                          ),
                  )
                ],
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      ),
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Total Expense",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Protest",
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 44, 44, 44),
                  border: Border.all(
                    color: const Color.fromARGB(255, 70, 70, 70),
                    width: 7,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_outward,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _data.get('exponly') == null ? "0" : _data.get('exponly'),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Divider(
                color: Colors.grey[700],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                padding: EdgeInsets.all(15),
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Expense",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: expenseAdd,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              // onLongPress: () {
                              //   setState(() {
                              //     data.removeAt(index);
                              //   });
                              // },
                              leading: _data.get('exp') == null
                                  ? Text("0")
                                  : Text(
                                      "₹ ${data[index]["expense"]}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                              title: _data.get('exp') == null
                                  ? Text("0")
                                  : Text(data[index]["paid"]),
                              trailing: Column(
                                children: [
                                  Text(data[index]["time"]),
                                  Text(data[index]["date"]),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
