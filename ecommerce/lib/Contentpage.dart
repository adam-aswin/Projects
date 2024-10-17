import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Contentpage extends StatefulWidget {
  const Contentpage({super.key});

  @override
  State<Contentpage> createState() => _ContentpageState();
}

class _ContentpageState extends State<Contentpage> {
  int? ind;
  List data = [];
  List img = [];
  final mydata = Hive.box('products');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    data = mydata.get('key');
  }

  @override
  Widget build(BuildContext context) {
    ind = int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Image.asset(
              "./lib/icons/add-to-cart.png",
              height: 25,
              width: 25,
            ),
          ),
        ],
        title: Container(
          height: 30,
          width: 250,
          child: Expanded(
              child: TextField(
            decoration: InputDecoration(
              // fillColor: const Color.fromARGB(230, 255, 255, 255),
              // filled: true,
              prefixIcon: Icon(Icons.search),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.mic),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.camera_alt_outlined),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(color: Colors.blue),
              // ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          )),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .6,
                    color: Colors.grey[100],
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data[ind!]["images"].length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .6,
                            color: Colors.grey[100],
                            child: Image.network(
                              data[ind!]["images"][index],
                              fit: BoxFit.contain,
                            ),
                            // child: Text(data[ind!]["reviews"][index]["comment"]),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data[ind!]["brand"] != null
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[ind!]["brand"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: data[ind!]["rating"] >= 4
                                                ? Colors.green
                                                : data[ind!]["rating"] >= 3
                                                    ? Colors.orange
                                                    : Colors.red,
                                          ),
                                          Text(data[ind!]["rating"].toString())
                                        ],
                                      )
                                    ],
                                  )
                                : Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 0,
                                    ),
                                  ),
                            data[ind!]["brand"] != null
                                ? Text(
                                    data[ind!]["description"],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black87,
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[ind!]["title"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: data[ind!]["rating"] >= 4
                                                ? Colors.green
                                                : data[ind!]["rating"] >= 3
                                                    ? Colors.orange
                                                    : Colors.red,
                                          ),
                                          Text(
                                            data[ind!]["rating"].toString(),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                            data[ind!]["brand"] != null
                                ? Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 0,
                                    ),
                                  )
                                : Text(
                                    data[ind!]["description"],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data[ind!]["stock"] > 10
                                        ? Text(
                                            "In Stock",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : Row(
                                            children: [
                                              Text(
                                                "Stock left: ",
                                                style: TextStyle(
                                                  color:
                                                      data[ind!]["stock"] > 10
                                                          ? Colors.green
                                                          : Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                data[ind!]["stock"].toString(),
                                                style: TextStyle(
                                                  color:
                                                      data[ind!]["stock"] > 10
                                                          ? Colors.green
                                                          : Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "\$ ${data[ind!]["price"].toString()}",
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color:
                                            const Color.fromARGB(220, 0, 0, 0),
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
                                            "${(data[ind!]["price"] - (data[ind!]["price"] * (data[ind!]["discountPercentage"] / 100))).toString()}",
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 35),
                                  child: Text(
                                    "↓${data[ind!]["discountPercentage"].toString()} %",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(data[ind!]["warrantyInformation"]),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(data[ind!]["shippingInformation"]),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(data[ind!]["availabilityStatus"]),
                              ],
                            ),
                            Divider(),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Reviews",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 50),
                              child: Row(
                                children: [
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star_half),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  VerticalDivider(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("4"),
                                          Icon(Icons.star),
                                          Container(
                                            height: 10,
                                            width: 100,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("3"),
                                          Icon(Icons.star),
                                          Container(
                                            height: 10,
                                            width: 90,
                                            color: Colors.amber,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("2"),
                                          Icon(Icons.star),
                                          Container(
                                            height: 10,
                                            width: 70,
                                            color: Colors.orange,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("1"),
                                          Icon(Icons.star),
                                          Container(
                                            height: 10,
                                            width: 50,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .3,
                              child: Expanded(
                                child: ListView.builder(
                                  itemCount: data[ind!]["reviews"].length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[ind!]["reviews"][index]
                                                ["reviewerName"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data[ind!]["reviews"][index]
                                                        ["rating"]
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.black,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      subtitle: Text(
                                        data[ind!]["reviews"][index]["comment"],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 45,
              color: Colors.amber,
              child: Text(
                "Buy Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
