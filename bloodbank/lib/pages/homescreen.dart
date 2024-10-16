import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 168, 12, 0),
        title: Text(
          "Welcome Home",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(255, 168, 12, 0),
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SAVE LIFE BY",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        "DONATING BLOOD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: const Color.fromARGB(255, 168, 12, 0),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.bloodtype,
                            color: const Color.fromARGB(255, 168, 12, 0),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Be a Life Saver"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Container(
                    width: 150,
                    child: Image.asset("./images/blood.jpg"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  height: 120,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                          color: Colors.black26,
                          offset: Offset(5, 5),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        child: Image.asset("./images/request.webp"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Text(
                        "Request For Blood",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 10,
                        ),
                      ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/add");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .45,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: Colors.black26,
                            offset: Offset(5, 5),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: Image.asset("./images/add.webp"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: 30,
                            width: 80,
                            child: Text(
                              "Add Donor",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Donors",
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 10,
                        right: 10,
                        bottom: 70,
                      ),
                      color: Colors.white,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
