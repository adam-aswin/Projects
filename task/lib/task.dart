import 'dart:io';

import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({super.key});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  String? _selectedmin;
  String? _selectedhr;
  String? _selectedday;
  String? _selecteddate;
  String? _selectedmonth;
  String? dayss;
  List<String> min = [];
  List<String> hr = [];
  List<String> day = [];
  List<String> date = [];
  List<String> month = [];
  File file = File("details.txt");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minute();
    hour();
    days();
    datef();
    monthf();
  }

  void files() {
    var data = {
      "Minute": _selectedmin == null ? "*" : _selectedmin,
      "Hour": _selectedhr == null ? "*" : _selectedhr,
      "Date": _selecteddate == null ? "*" : _selecteddate,
      "Month": _selectedmonth == null ? "*" : _selectedmonth,
      "Day": _selectedday == null ? "*" : _selectedday,
    };

    file.writeAsStringSync(data.toString());
  }

  void minute() {
    for (int i = 0; i <= 59; i++) {
      min.add(i.toString());
    }
    print(min);
  }

  void hour() {
    for (int i = 0; i <= 23; i++) {
      hr.add(i.toString());
    }
    print(hr);
  }

  void days() {
    for (int i = 0; i <= 6; i++) {
      i == 0
          ? dayss = "Sunday"
          : i == 1
              ? dayss = "Monday"
              : i == 2
                  ? dayss = "Tuesday"
                  : i == 3
                      ? dayss = "Wednesday"
                      : i == 4
                          ? dayss = "Thursday"
                          : i == 5
                              ? dayss = "Friday"
                              : i == 6
                                  ? dayss = "Saturday"
                                  : "";
      day.add(dayss!);
    }
    print(day);
  }

  void datef() {
    for (int i = 1; i <= 31; i++) {
      date.add(i.toString());
    }
    print(date);
  }

  void monthf() {
    for (int i = 1; i <= 12; i++) {
      month.add(i.toString());
    }
    print(month);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            files();
          });
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 100,
              padding: EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _selectedmin == null ? "Minute" : "$_selectedmin",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton(
                    underline: Container(
                      height: 0,
                    ),
                    items: min.map(
                      (String min) {
                        return DropdownMenuItem(
                          value: min,
                          child: Text(min),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedmin = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 100,
              padding: EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _selectedhr == null ? "Hour" : "$_selectedhr",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton(
                    underline: Container(
                      height: 0,
                    ),
                    items: hr.map(
                      (String hr) {
                        return DropdownMenuItem(
                          value: hr,
                          child: Text(hr),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedhr = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 100,
              padding: EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _selecteddate == null ? "Date" : "$_selecteddate",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton(
                    underline: Container(
                      height: 0,
                    ),
                    items: date.map(
                      (String date) {
                        return DropdownMenuItem(
                          value: date,
                          child: Text(date),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selecteddate = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 100,
              padding: EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _selectedmonth == null ? "Month" : "$_selectedmonth",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton(
                    underline: Container(
                      height: 0,
                    ),
                    items: month.map(
                      (String month) {
                        return DropdownMenuItem(
                          value: month,
                          child: Text(month),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedmonth = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 191,
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _selectedday == null ? "Day" : "$_selectedday",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton(
                    underline: Container(
                      height: 0,
                    ),
                    items: day.map(
                      (String day) {
                        return DropdownMenuItem(
                          value: day,
                          child: Text(day),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedday = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
