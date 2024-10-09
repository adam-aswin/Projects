import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contentpage extends StatefulWidget {
  const Contentpage({super.key});

  @override
  State<Contentpage> createState() => _ContentpageState();
}

class _ContentpageState extends State<Contentpage> {
  int index=0;
  List data = [];
  List data1 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var res = await http.get(Uri.parse('https://dummyjson.com/products'));
    // print(res.body[1]);
    setState(() {
      data.add(jsonDecode(res.body));
      data1 = data[0]["products"];
    });
    print(data1);
  }

  @override
  Widget build(BuildContext context) {
    index=int.parse(ModalRoute.of(context)?.settings.arguments as String);
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
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              color: Colors.grey[100],
              child: Image.network(data1[index]["images"][0],fit: BoxFit.contain,),
              ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data1[index]["brand"] != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data1[index]["brand"],
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
                                        color: data1[index]["rating"] >= 4
                                            ? Colors.green
                                            : data1[index]["rating"] >= 3
                                                ? Colors.orange
                                                : Colors.red,
                                      ),
                                      Text(data1[index]["rating"].toString())
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
                        data1[index]["brand"] != null
                            ? Text(
                                data1[index]["description"],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data1[index]["title"],
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
                                        color: data1[index]["rating"] >= 4
                                            ? Colors.green
                                            : data1[index]["rating"] >= 3
                                                ? Colors.orange
                                                : Colors.red,
                                      ),
                                      Text(
                                        data1[index]["rating"].toString(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                        data1[index]["brand"] != null
                            ? Text(
                                "",
                                style: TextStyle(
                                  fontSize: 0,
                                ),
                              )
                            : Text(
                                data1[index]["description"],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$ ${data1[index]["price"].toString()}",
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
                                        "${(data1[index]["price"] - (data1[index]["price"] * (data1[index]["discountPercentage"] / 100))).toString()}",
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
                            SizedBox(width: 10,),
                            Text(
                              "↓${data1[index]["discountPercentage"].toString()} %",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}