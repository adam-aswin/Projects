import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:mymessenger/Userprovider.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool obs = true;
  CollectionReference user_details =
      FirebaseFirestore.instance.collection("User_Details");
  final mydata = Hive.box('mydata');

  Future addUser(userid, username) async {
    QuerySnapshot querySnapshot =
        await user_details.where('uid', isEqualTo: userid).get();
    if (querySnapshot.docs.isEmpty) {
      user_details.add({'uid': userid, 'user': username});
    }
  }

  void addId(userid, username) {
    Map<String, dynamic> data = {'uid': userid, 'user': username};
    mydata.put('sender', data);
  }

  Future signIn() async {
    try {
      final uc = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
      Provider.of<Userprovider>(context, listen: false)
          .setUid(uc.user?.uid ?? '');
      print("===================================================");
      print(Provider.of<Userprovider>(context, listen: false).uid);
      // print(uc.user);
      print("===================================================");
      addUser(uc.user?.uid, uc.user?.displayName);
      addId(uc.user?.uid, uc.user?.displayName);
      print("===================================================");
      print(mydata.get('sender'));
      print("===================================================");

      // final data = {"user": uc.user?.displayName, "uid": uc.user?.uid};
      // user_details.add(data);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in: $e"),
      ));
    }
  }

  Future signInWithGoogle() async {
    final firebaseAuth = await FirebaseAuth.instance;
    final googleservices = await GoogleSignIn();
    final googleUser = await googleservices.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final cred = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    final user = await firebaseAuth.signInWithCredential(cred);
    // final data = {"user": user.user?.displayName, "uid": user.user?.uid};
    // user_details.add(data);
    // Provider.of<Userprovider>(context, listen: false)
    //     .setUid(user.user?.uid ?? '');
    print("===================================================");
    // print(Provider.of<Userprovider>(context, listen: false).uid);
    print("===================================================");
    addUser(user.user?.uid, user.user?.displayName);

    addId(user.user?.uid, user.user?.displayName);
    print("===================================================");
    print(mydata.get('sender'));
    print("===================================================");
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset(
            "./images/favpng_chat-box.png",
            height: 250,
            width: 250,
            color: Colors.white,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.only(left: 50, right: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: "Email",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.only(left: 50, right: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              controller: _password,
              obscureText: obs,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obs = !obs;
                    });
                  },
                  icon: Icon(obs
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: "Password",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/forgot");
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: signIn,
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            child: TextButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                onPressed: signInWithGoogle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "./lib/icons/google.png",
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "Sign In with Google",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/sign");
            },
            child: Text(
              "Create account",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
