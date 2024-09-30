import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Botttomnavigation extends StatelessWidget {
  void Function(int)? onTabChange;
  Botttomnavigation({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // color: Colors.white,
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        haptic: true,
        color: Colors.grey,
        tabBorderRadius: 5,
        tabBackgroundColor: Colors.white,
        gap: 5,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: "Home",
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: "Cart",
          ),
        ],
      ),
    );
  }
}
