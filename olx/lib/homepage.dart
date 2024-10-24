import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final mydata = Hive.box('mydata');
  Map data = {};
  List products = [];
  String? img;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var token = mydata.get('key');
    var response = await http.get(
      Uri.parse("http://jandk.tech/api/getproducts"),
      headers: {"Authorization": 'Bearer ${token}'},
    );
    // print(response.body);
    setState(() {
      data = jsonDecode(response.body);
      products = data["products1"];
    });
    print(products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[400],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.3 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(5, 5),
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Image.asset(
                        ,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      products[index]["pname"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
