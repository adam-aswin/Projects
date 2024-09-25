import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Expensepage extends StatefulWidget {
  const Expensepage({super.key});

  @override
  State<Expensepage> createState() => _ExpensepageState();
}

class _ExpensepageState extends State<Expensepage> {
  final _data = Hive.box('mydata');
  TextEditingController expense = TextEditingController();
  TextEditingController paid = TextEditingController();
  int value = 0;
  List data = [];

  void saveData() {
    setState(() {
      if (expense.text == "") {
        print("null");
      } else {
        if (_data.get('exp') != null) {
          data = _data.get('exp');
          // value = int.parse();
          value += int.parse(expense.text);
          // data.add(
          //   {
          //     "expense":value.toString(),
          //     "date":
          //   }
          // );
        } else {
          _data.put('exp', expense.text);
        }
      }
      Navigator.pop(context);
    });
  }

  void expenseAdd() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text(
              "ADD EXPENSE",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Container(
              height: 250,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      controller: expense,
                      decoration: InputDecoration(
                        hintText: "Expense",
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      controller: paid,
                      decoration: InputDecoration(
                        hintText: "Paid to",
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 15, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Bill",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 17),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_circle_outline),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: saveData,
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      ),
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Total Expense",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Protest",
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 44, 44, 44),
                  border: Border.all(
                    color: const Color.fromARGB(255, 70, 70, 70),
                    width: 7,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_outward,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _data.get('exp') == null ? "0" : _data.get('exp'),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Divider(
                color: Colors.grey[700],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                padding: EdgeInsets.all(15),
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Expense",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: expenseAdd,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Add",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("data"),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
