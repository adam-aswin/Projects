import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  final _login = Hive.box('loginkey');
  List login_data = [];
  var hashdata;
  var hashdata1;
  bool ischecked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  void hashpwd() {
    hashdata = hashpassword(pass.text);
    hashdata1 = hashcpwd(cpass.text);
    print(hashdata);
  }

  void check() {
    if (email.text == "" ||
        phone.text == "" ||
        pass.text == "" ||
        cpass.text == "") {
      ischecked = false;
    } else {
      ischecked = true;
    }
  }

  String hashcpwd(String cpwd) {
    var byte = utf8.encode(cpwd);
    var data = sha256.convert(byte);
    return data.toString();
  }

  String hashpassword(String pwd) {
    var byte = utf8.encode(pwd);
    var data = sha256.convert(byte);
    return data.toString();
  }

  void addData() {
    if (_login.get('key') != null) {
      login_data = _login.get('key');
      login_data.add({
        "email": email.text,
        "phone": phone.text,
        "password": pass.text,
        "confirmpass": cpass.text,
      });
      _login.put('key', login_data);
    } else {
      login_data = [
        {
          "email": email.text,
          "phone": phone.text,
          "password": pass.text,
          "confirmpass": cpass.text,
        }
      ];
      _login.put('key', login_data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 235, 230, 227),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: SingleChildScrollView(
        child: Stack(
          // clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topCenter,
              child: Image.asset("./images/login(1).jpg"),
            ),
            // Expanded(child: TextField()),
            Positioned(
              bottom: -40,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .7,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(70),
                  ),
                  color: const Color.fromARGB(255, 235, 230, 227),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(255, 214, 202, 194),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 214, 202, 194),
                      ),
                      child: Expanded(
                        child: TextField(
                          controller: email,
                          enabled: true,
                          decoration: InputDecoration(
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.brown,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Email Id",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 214, 202, 194),
                      ),
                      child: Expanded(
                        child: TextField(
                          controller: phone,
                          enabled: true,
                          decoration: InputDecoration(
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.brown,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Mobile number",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 214, 202, 194),
                      ),
                      child: Expanded(
                        child: TextField(
                          controller: pass,
                          enabled: true,
                          decoration: InputDecoration(
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.brown,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Create new password",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 214, 202, 194),
                      ),
                      child: Expanded(
                        child: TextField(
                          controller: cpass,
                          enabled: true,
                          decoration: InputDecoration(
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.brown,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Confirm password",
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    ischecked == true
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  top: 14, bottom: 14, left: 35, right: 35),
                              backgroundColor:
                                  const Color.fromARGB(255, 167, 120, 104),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              hashpwd();
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 214, 202, 194),
                              ),
                            ),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  top: 14, bottom: 14, left: 35, right: 35),
                              backgroundColor:
                                  const Color.fromARGB(255, 153, 138, 132),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 214, 202, 194),
                              ),
                            ),
                          ),
                    Image.asset(
                      "./images/pngwing.com.png",
                      height: 60,
                      width: 60,
                    ),
                    //
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
