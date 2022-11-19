import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Student/profile_entry.dart';
import 'home_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                  gradient: LinearGradient(
                      colors: [(new Color(0xFF64B5F6)),(new Color(0xFF01579B))],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Image.asset("images/signup.png"),
                      height: 240,
                      width: 300,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 20),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: fnamecontroller,
                cursorColor: Color(0xDD000000),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xDD000000),
                    ),
                    hintText: "Full name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: emailcontroller,
                cursorColor: Color(0xDD000000),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email_rounded,
                      color: Color(0xDD000000),
                    ),
                    hintText: "Enter Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: phonecontroller,
                cursorColor: Color(0xDD000000),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xDD000000),
                    ),
                    hintText: "Phone Number",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: pwdcontroller,
                obscureText: true,
                cursorColor: Color(0xDD000000),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key_sharp,
                      color: Color(0xDD000000),
                    ),
                    hintText: "Enter Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),
              ),
            ),
            GestureDetector(
              onTap: ()=>{
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: pwdcontroller.text).then((value){
                  print("Created a New Account");
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ProfileEntry()));
                }).onError((error, stackTrace){
                  print("Error ${error.toString()}");
                })

              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [(new Color(0xFF64B5F6)),(new Color(0xFF01579B))],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                child: Text("Sign Up",
                  style: TextStyle(
                      color: Colors.white
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
