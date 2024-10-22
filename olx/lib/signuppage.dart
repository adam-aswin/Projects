import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController uname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController add = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController phone = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool lock = true;
  Map data = {};
  String? base;

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

  void camera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
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
              backgroundColor: Color.fromARGB(255, 247, 255, 247),
              title: Text(
                "Choose a File",
                style: TextStyle(color: Colors.green),
              ),
              actions: [
                TextButton(
                  onPressed: gallery,
                  child: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                TextButton(
                  onPressed: camera,
                  child: Text(
                    "Camera",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            );
          });
    } else {
      print("null");
    }
  }

  void saveData() async {
    if (_image != null) {
      final bytes = await _image!.readAsBytes();
      final base64img = base64Encode(bytes);
      base = base64img;
    }
    data = {
      "username": uname.text,
      "email": email.text,
      "password": pass.text,
      "cpassword": cpass.text,
      "place": place.text,
      "address": add.text,
      "profile": base,
      "pincode": pin.text,
      "phone": phone.text
    };
    var response = await http.post(
      Uri.parse("http://jandk.tech/api/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 255, 247),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 255, 247),
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: pickimage,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 132, 221, 136),
                    ),
                    child: _image != null
                        ? ClipOval(
                            child: Image.file(
                              _image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 247, 255, 247),
                            size: 90,
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 222, 253, 220),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(5, 5))
                      ]),
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: uname,
                      decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(
                            color: Colors.green,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 222, 253, 220),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(5, 5))
                      ]),
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.green,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 222, 253, 220),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(5, 5))
                      ]),
                  child: Expanded(
                    child: TextField(
                      obscureText: lock,
                      keyboardType: TextInputType.name,
                      controller: pass,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.green,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.green,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                lock ? lock = false : lock = true;
                              });
                            },
                            child: Icon(
                              lock
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              color: Colors.green,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 222, 253, 220),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(5, 5))
                      ]),
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: cpass,
                      decoration: InputDecoration(
                          hintText: "Confirm Paassword",
                          hintStyle: TextStyle(
                            color: Colors.green,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 222, 253, 220),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(5, 5))
                      ]),
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: place,
                      decoration: InputDecoration(
                          hintText: "Place",
                          hintStyle: TextStyle(
                            color: Colors.green,
                          ),
                          prefixIcon: Icon(
                            Icons.place,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 222, 253, 220),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(5, 5))
                      ]),
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: add,
                      decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: TextStyle(
                            color: Colors.green,
                          ),
                          prefixIcon: Icon(
                            Icons.pin_drop,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 222, 253, 220),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(5, 5))
                      ]),
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: pin,
                      decoration: InputDecoration(
                          hintText: "Pincode",
                          hintStyle: TextStyle(
                            color: Colors.green,
                          ),
                          prefixIcon: Icon(
                            Icons.pin,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 222, 253, 220),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(5, 5))
                      ]),
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: phone,
                      decoration: InputDecoration(
                          hintText: "Phone",
                          hintStyle: TextStyle(
                            color: Colors.green,
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 12, bottom: 12),
                    elevation: 4,
                  ),
                  onPressed: () {
                    saveData();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/login", (route) => false);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 247, 255, 247),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
