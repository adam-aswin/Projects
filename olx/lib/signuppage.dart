import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
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
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
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
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
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
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
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
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
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
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
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
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
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
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
