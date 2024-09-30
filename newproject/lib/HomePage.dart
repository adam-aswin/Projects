import 'package:flutter/material.dart';
import 'package:newproject/components/BotttomNavigation.dart';
import 'package:newproject/components/Cartpage.dart';
import 'package:newproject/components/ShopPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedpage = 0;
  List<Widget> pages = [Shoppage(), Cartpage()];
  void changetab(int index) {
    setState(() {
      selectedpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: Botttomnavigation(
        onTabChange: (index) => changetab(index),
      ),
      body: pages[selectedpage],
    );
  }
}
