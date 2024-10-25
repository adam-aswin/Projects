import 'dart:convert';
import 'dart:typed_data';

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
  Map user = {};
  List products = [];
  Uint8List? img;
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
      // print(data['id']);
      products = data["products1"];
    });
    var res = await http
        .get(Uri.parse('http://jandk.tech/api/getuser/${data['id']}'));
    setState(() {
      user = jsonDecode(res.body);
    });
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.green[300],
      ),
      drawer: Drawer(
        backgroundColor: Colors.green[300],
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.green[100],
              ),
              // child: ClipOval(
              //   child: Image.memory(
              //     img = base64Decode(user["profile"]),
              //     fit: BoxFit.contain,
              //   ),
              // ),
            ),
          ],
        ),
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
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
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
                        color: Colors.green[100],
                      ),
                      child: products[index]["images"] != null
                          ? Image.memory(
                            base64Decode(products[index]["images"][0]),
                              fit: BoxFit.contain,
                            )
                          : Text(""),
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
