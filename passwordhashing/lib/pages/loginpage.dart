import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 235, 230, 227),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: SingleChildScrollView(
        child: Stack(
          // clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topCenter,
              child: Image.asset("./images/login(1).jpg"),
            ),
            // Expanded(child: TextField()),
            Positioned(
              bottom: -40,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .7,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(70),
                  ),
                  color: const Color.fromARGB(255, 235, 230, 227),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 214, 202, 194),
                      ),
                      child: Expanded(
                        child: TextField(
                          enabled: true,
                          decoration: InputDecoration(
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.brown,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "User name",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 214, 202, 194),
                      ),
                      child: Expanded(
                        child: TextField(
                          enabled: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.brown,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Password"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget password?",
                          style: TextStyle(color: Colors.brown),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 35, right: 35),
                        backgroundColor:
                            const Color.fromARGB(255, 167, 120, 104),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 214, 202, 194),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "./images/pngwing.com.png",
                      height: 60,
                      width: 60,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                          left: 80,
                          right: 80,
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 235, 230, 227),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.brown,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/sign");
                      },
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      color: Colors.brown[400],
                    ),
                    Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
