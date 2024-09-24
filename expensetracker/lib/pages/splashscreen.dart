import 'package:expensetracker/pages/Homepage.dart';
import 'package:expensetracker/pages/homescreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen();
  }

  Future<void> splashscreen() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset(
                "./lib/icons/multiply-sign.png",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "MY EXPENSE",
              style: TextStyle(
                color: const Color.fromARGB(255, 83, 192, 87),
                fontFamily: "Protest",
                fontSize: 24,
                // fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
