import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final _coffees = Hive.box('coffees');
  List coffee = [];
  num sum = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    total();
  }

  void getData() {
    if (_coffees.get('key') != null) {
      coffee = _coffees.get('key');
    } else {
      null;
    }
  }

  void total() {
    for (Map i in coffee) {
      print(i["price"]);
      sum = sum + i["price"] * i["qty"];
      print(sum);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 209, 190, 178),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.more_horiz,
          color: Colors.white,
        ),
        title: Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("./images/coffee (copy).jpg"),
            Expanded(
              child: ListView.builder(
                padding:
                    EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                itemCount: coffee.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset: Offset(5, 5),
                            color: const Color.fromARGB(255, 116, 81, 69),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 209, 190, 178),
                                ),
                                child: _coffees.get('key') != null
                                    ? Image.asset(
                                        coffee[index]["img"],
                                        fit: BoxFit.contain,
                                      )
                                    : null,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    coffee[index]["name"],
                                    style: TextStyle(
                                      fontFamily: "Kanit",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          coffee[index]["des"],
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹ ${(coffee[index]["price"] * coffee[index]["qty"]).toString()}",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontWeight: FontWeight.bold,
                                fontSize: 15.2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                coffee[index]["qty"] <= 0
                                    ? Image.asset(
                                        "lib/icons/subtraction (1).png",
                                        height: 21,
                                        width: 21,
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            coffee[index]["qty"]--;
                                            sum = sum - coffee[index]["price"];
                                            // minus();
                                          });
                                        },
                                        child: Image.asset(
                                          "./lib/icons/subtraction.png",
                                          height: 21,
                                          width: 21,
                                        ),
                                      ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(coffee[index]["qty"].toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      coffee[index]["qty"]++;
                                      sum = sum + coffee[index]["price"];
                                      // total();
                                    });
                                  },
                                  child: Image.asset(
                                    "./lib/icons/add-button.png",
                                    height: 23,
                                    width: 23,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              margin: EdgeInsets.only(right: 15, left: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 0,
                      offset: Offset(5, 5),
                      color: const Color.fromARGB(255, 116, 81, 69),
                    ),
                  ]),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Item Total",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.2,
                                ),
                              ),
                              Text(
                                "₹ ${sum.toString()}",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Taxes",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.2,
                                ),
                              ),
                              Text(
                                "₹ ${(sum * 5 / 100).toString()}",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              "________________________________________________"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "To Pay",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.2,
                                ),
                              ),
                              Text(
                                "₹ ${((sum) + (sum * 5 / 100)).toString()}",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.2,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
