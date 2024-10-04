import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 230, 227),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .7,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 214, 202, 194),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
