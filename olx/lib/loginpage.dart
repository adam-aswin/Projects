import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool lock = true;
  Map data = {};

  void saveData() async {
    data = {"email": email.text, "password": pass.text};
    var response = await http.post(
      Uri.parse("http://jandk.tech/api/signin"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    // print(response.body);
    var mp = jsonDecode(response.body);
    print(mp["token"]);
    if (response.statusCode == 200) {
      print("object");
    } else {
      Future.delayed(
        Duration(seconds: 2),
        () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                backgroundColor: Color.fromARGB(255, 247, 255, 247),
                alignment: Alignment.bottomCenter,
                children: [Center(child: Text(mp["msg"]))],
              );
            }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 255, 247),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("./images/3d-delivery-robot-working.png"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
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
                Text(
                  "Forget Password?",
                  style: TextStyle(
                    color: Colors.green,
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
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color.fromARGB(255, 247, 255, 247),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .18,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/sign");
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
