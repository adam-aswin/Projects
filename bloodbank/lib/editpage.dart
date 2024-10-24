import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
// import 'dart:typed_data';
import 'package:http/http.dart' as http;

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  TextEditingController c7 = TextEditingController();
  String? _selectedblood;
  String? id;
  String? _isSelected;
  File? _image;
  Map cnt = {};

  final List<String> bloodgroup = [
    "A-",
    "A+",
    "AB-",
    "AB+",
    "O+",
    "O-",
    "B+",
    "B-",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    print(id);
    var res1 = await http.get(Uri.parse('http://jandk.tech/api/getdonor/$id'));
    if (id != null) {
      var res1 =
          await http.get(Uri.parse('http://jandk.tech/api/getdonor/$id'));

      cnt = jsonDecode(res1.body);
    }
    print(cnt);
    setState(() {
      c1.text = cnt["name"];
      c2.text = cnt["age"].toString();
      c4.text = cnt["phone"].toString();
      c5.text = cnt["dob"];
      _selectedblood = cnt["blood_group"];
      c7.text = cnt["place"];
    });
  }

  void editData() async {
    Map data = {
      "name": c1.text,
      "age": c2.text,
      "phone": c4.text,
      "dob": c5.text,
      "blood_group": _selectedblood,
      "place": c7.text
    };
    print(data);
    var res = await http.put(
      Uri.parse('http://jandk.tech/api/editdonor/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    print(res.body);

    Navigator.pushNamedAndRemoveUntil(
        context, "/home1", (Route route) => false);
  }

  void dob() {
    RegExp reg = RegExp(r'(\d{4})-(0\d||1[0-2])-([0-2]\d||3[0-1])$');

    reg.hasMatch(c5.text) == false
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 247, 230, 230),
                title: Text("Incorrect Date"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  ),
                ],
              );
            })
        : editData();

    c5.clear();
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 230, 230),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 168, 12, 0),
          title: Text(
            "Donor Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  dob();
                },
                icon: Icon(
                  Icons.done,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 120),
                      ),
                      color: const Color.fromARGB(255, 168, 12, 0),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: 150,
                    child: GestureDetector(
                      // onTap: pickimage,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: ClipOval(
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  padding: EdgeInsets.all(25),
                                  child: Image.asset(
                                    "./lib/icons/user.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: -41,
                      right: 145,
                      child: GestureDetector(
                        // onTap: pickimage,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: const Color.fromARGB(255, 168, 12, 0),
                            size: 20,
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .63,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 247, 174, 174),
                            ),
                            child: TextField(
                              controller: c1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .63,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 247, 174, 174),
                            ),
                            child: TextField(
                              controller: c2,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Age",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .63,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 247, 174, 174),
                            ),
                            child: TextField(
                              controller: c4,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mobile Number",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "D O B",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .63,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 247, 174, 174),
                            ),
                            child: TextField(
                              controller: c5,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "yyyy mm dd",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Blood Group",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .63,
                            height: 50,
                            padding: EdgeInsets.only(left: 8, right: 5),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 247, 174, 174),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_selectedblood == null
                                    ? "Select a Blood Group"
                                    : "$_selectedblood"),
                                DropdownButton(
                                  icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined),
                                  dropdownColor:
                                      const Color.fromARGB(255, 247, 230, 230),
                                  underline: Container(
                                    height: 0,
                                  ),
                                  items: bloodgroup.map(
                                    (String blood) {
                                      return DropdownMenuItem(
                                        value: blood,
                                        child: Text(blood),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedblood = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Place",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .63,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 247, 174, 174),
                            ),
                            child: TextField(
                              controller: c7,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Place",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   // height: 150,
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.only(
                    //     left: 20,
                    //     right: 20,
                    //     top: 20,
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Checkbox(
                    //           activeColor: Colors.red,
                    //           value: _isChecked,
                    //           onChanged: (bool? value) {
                    //             setState(() {
                    //               _isChecked = value!;
                    //             });
                    //           }),
                    //       Text(
                    //         "I agree to be a donor, and Donor blood is tested \nfor infectious diseases (TTIs) such as HIV, \nHBs Ag, VDRL & HCV and blood group serology. \nThe screening of Transfusion Transmitted \nInfectious Marker (TTIs) is done by ELISA \nMethod.",
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Text(cnt["name"])
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
