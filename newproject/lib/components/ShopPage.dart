import 'package:flutter/material.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 209, 190, 178),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          child: Icon(
            Icons.more_horiz_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Coffee",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              child: Image.asset("./images/coffee.jpg"),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Card();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
