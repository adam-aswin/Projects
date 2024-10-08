import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 146, 198, 240),
        title: Container(
          height: 30,
          width: 250,
          child: Expanded(
              child: TextField(
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(230, 255, 255, 255),
              filled: true,
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
      body: GridView.builder(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        itemCount: data1.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.5 / 3),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey,
                    offset: Offset(5, 5),
                    spreadRadius: 0,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Image.network(
                    data1[index]["images"][0],
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                data1[index]["brand"] != null
                    ? Text(
                        data1[index]["brand"],
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
                data1[index]["brand"] != null
                    ? Text(
                        data1[index]["title"],
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      )
                    : Text(
                        data1[index]["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
