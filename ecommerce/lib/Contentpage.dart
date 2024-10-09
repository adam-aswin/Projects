import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Contentpage extends StatefulWidget {
  const Contentpage({super.key});

  @override
  State<Contentpage> createState() => _ContentpageState();
}

class _ContentpageState extends State<Contentpage> {
  int index = 0;
  List data = [];
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
    index = int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
              color: Colors.grey[100],
              child: Image.network(
                data[index]["images"][0],
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data[index]["brand"] != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data[index]["brand"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: data[index]["rating"] >= 4
                                      ? Colors.green
                                      : data[index]["rating"] >= 3
                                          ? Colors.orange
                                          : Colors.red,
                                ),
                                Text(data[index]["rating"].toString())
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
                  data[index]["brand"] != null
                      ? Text(
                          data[index]["description"],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data[index]["title"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: data[index]["rating"] >= 4
                                      ? Colors.green
                                      : data[index]["rating"] >= 3
                                          ? Colors.orange
                                          : Colors.red,
                                ),
                                Text(
                                  data[index]["rating"].toString(),
                                )
                              ],
                            ),
                          ],
                        ),
                  data[index]["brand"] != null
                      ? Text(
                          "",
                          style: TextStyle(
                            fontSize: 0,
                          ),
                        )
                      : Text(
                          data[index]["description"],
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$ ${data[index]["price"].toString()}",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: const Color.fromARGB(220, 0, 0, 0),
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
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "↓${data[index]["discountPercentage"].toString()} %",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      data[index]["stock"] > 10
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
                                    color: data[index]["stock"] > 10
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["stock"].toString(),
                                  style: TextStyle(
                                    color: data[index]["stock"] > 10
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
