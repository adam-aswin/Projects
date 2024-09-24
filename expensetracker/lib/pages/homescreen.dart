import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expensetracker/pages/Homepage.dart';
import 'package:expensetracker/pages/expensepage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int index = 0;
  List<Widget> screens = [Homepage(), Expensepage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
            Color(value);
          });
        },

        // buttonBackgroundColor: const Color.fromARGB(255, 0, 148, 62),
        items: [
          Container(
            height: 20,
            width: 20,
            child: Image.asset(
              "./lib/icons/multiply-sign.png",
              fit: BoxFit.cover,
              color: index == 0 ? null : Colors.grey[600],
            ),
          ),
          Icon(
            Icons.bar_chart_rounded,
            color: index == 1 ? Colors.green : Colors.grey[600],
          ),
        ],
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 27, 27, 27),
      ),
      body: screens[index],
    );
  }
}
