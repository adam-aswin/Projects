import 'package:flutter/material.dart';

class Statementpage extends StatefulWidget {
  const Statementpage({super.key});

  @override
  State<Statementpage> createState() => _StatementpageState();
}

class _StatementpageState extends State<Statementpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 44),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Statement",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[900],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "6",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
