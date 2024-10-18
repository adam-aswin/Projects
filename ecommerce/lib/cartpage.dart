import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  List data = [];
  final mydata = Hive.box('products');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    setState(() {
      if (mydata.get('key1') != null) {
        data = mydata.get('key1');
      } else {
        null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: EdgeInsets.only(left: 15, right: 15),
                                color: Colors.grey[200],
                                child: Image.network(
                                  data[index]["images"][0],
                                  fit: BoxFit.contain,
                                ),
                                // child: Text(data[ind!]["reviews"][index]["comment"]),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  data[index]["brand"] != null
                                      ? Text(
                                          data[index]["brand"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 0,
                                          ),
                                        ),
                                  data[index]["brand"] != null
                                      ? Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .7,
                                          child: Text(
                                            data[index]["description"],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          data[index]["title"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  data[index]["brand"] != null
                                      ? Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 0,
                                          ),
                                        )
                                      : Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .7,
                                          child: Text(
                                            data[index]["description"],
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "\$ ${data[index]["price"].toString()}",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: const Color.fromARGB(
                                                  220, 0, 0, 0),
                                              fontSize: 13.5,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "\$",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: 40,
                                                height: 20,
                                                child: Text(
                                                  "${(data[index]["price"] - (data[index]["price"] * (data[index]["discountPercentage"] / 100))).toString()}",
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(top: 35),
                                        child: Text(
                                          "↓${data[index]["discountPercentage"].toString()} %",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      data.removeAt(index);
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            data.removeAt(index);
                                          });
                                        },
                                        child: Text(
                                          "Remove",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                                VerticalDivider(),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Buy Now",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.flash_on_rounded,
                                      color: Colors.black,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 45,
            color: Colors.amber,
            child: Text(
              "Place Order",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
