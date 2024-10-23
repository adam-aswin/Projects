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
  Map data={};
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
    data = jsonDecode(response.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            data["products1"][0]["pname"],
          ),
        ),
      ),
    );
  }
}
