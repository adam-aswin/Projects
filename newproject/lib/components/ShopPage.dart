import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  List _coffee = [
    {
      "name": "Caffe Americano",
      "des":
          "An Americano coffee is distinct in aroma and mouthfeel. The aroma is characterized by a mild, roasted fragrance, while the flavor is smooth and bold.",
      "price": 270,
      "img": "./images/americano.png",
      "qty": 0,
    },
    {
      "name": "Cappuccino",
      "des":
          "A cappuccino is a beloved espresso-based hot coffee drink made with layering of espresso, steamed milk, and milk foam on top.",
      "price": 280,
      "img": "./images/cappuccino.png",
      "qty": 0,
    },
    {
      "name": "Caffe Latte",
      "des":
          "Caffè latte is a milk coffee that boasts a silky layer of foam as a real highlight of the drink.",
      "price": 240,
      "img": "./images/latte.png",
      "qty": 0,
    },
    {
      "name": "Doppio Espresso",
      "des":
          " Espresso is thicker than regular coffee and has a layer of “crema” on top, which results from air bubbles mixing with the coffee's oils.",
      "price": 260,
      "img": "./images/espresso.png",
      "qty": 0,
    },
    {
      "name": "Iced Caffè Americano",
      "des":
          "An Iced Americano is a refreshing coffee beverage made with espresso and cold water, served over ice.",
      "price": 300,
      "img": "./images/iced_americano.png",
      "qty": 0,
    },
    {
      "name": "Caramel Macchiato",
      "des":
          "The defining characteristic of a caramel macchiato is the generous drizzle of caramel sauce over the top.",
      "price": 350,
      "img": "./images/caramel_macchiato.png",
      "qty": 0,
    },
  ];
  List cart = [];
  bool isAdd = false;

  final _coffees = Hive.box('coffees');
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
              child: GridView.builder(
                  padding:
                      EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.3 / 3,
                  ),
                  itemCount: _coffee.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 116, 81, 69),
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              width: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: const Color.fromARGB(255, 209, 190, 178),
                              ),
                              child: Image.asset(
                                _coffee[index]["img"],
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Text(
                              _coffee[index]["name"],
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontWeight: FontWeight.bold,
                                fontSize: 15.2,
                              ),
                            ),
                            Text(
                              _coffee[index]["des"],
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹ ${_coffee[index]["price"].toString()}",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.2,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _coffee[index]["qty"]++;
                                      if (_coffee[index]["qty"] > 1) {
                                        _coffee[index]["qty"]--;
                                      } else {
                                        cart.add(_coffee[index]);
                                      }
                                      _coffees.put('key', cart);
                                      isAdd = true;

                                      print(cart);
                                    });
                                  },
                                  child: _coffee[index]["qty"] == 0
                                      ? Image.asset(
                                          "./lib/icons/cart (1).png",
                                          height: 25,
                                          width: 25,
                                        )
                                      : Image.asset(
                                          "./lib/icons/checklist.png",
                                          height: 22,
                                          width: 22,
                                        ),
                                  // child: Image.asset(
                                  //   "./lib/icons/cart (1).png",
                                  //   height: 25,
                                  //   width: 25,
                                  // ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
