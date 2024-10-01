import 'package:flutter/material.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  List _coffee = [
    {
      "name": "Caffe Americano",
      "price": 270,
      "img": "./images/americano.png",
      "qty": 0,
    },
    {
      "name": "Cappuccino",
      "price": 280,
      "img": "./images/cappuccino.png",
      "qty": 0,
    },
    {
      "name": "Doppio Espresso",
      "price": 260,
      "img": "./images/espresso.png",
      "qty": 0,
    },
    {
      "name": "Iced Caffè Americano",
      "price": 300,
      "img": "./images/iced_americano.png",
      "qty": 0,
    },
    {
      "name": "Latte Macchiato",
      "price": 250,
      "img": "./images/latte_macchiato.png",
      "qty": 0,
    },
    {
      "name": "Caffe Latte",
      "price": 240,
      "img": "./images/latte.png",
      "qty": 0,
    },
  ];
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
            // SizedBox(
            //   height: 30,
            // ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.only(top: 30),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.5 / 3,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 116, 81, 69),
                                    blurRadius: 5,
                                    spreadRadius: 0,
                                    offset: Offset(5, 5)),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  _coffee[index]["img"],
                                  fit: BoxFit.contain,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
