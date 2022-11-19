import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:picozen/screens/home_screen.dart';
import 'package:picozen/screens/signup_screen.dart';

import '../admin/homepage.dart';
import 'forgetpassword.dart';

class AdminSignInScreen extends StatefulWidget {
  const AdminSignInScreen({Key? key}) : super(key: key);

  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: Color(0xFFD6D6D6),
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
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset("images/login.png"),
                      height: 310,
                      width: 250,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 10, bottom: 3),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Admin Login",
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
            Container(
              margin: EdgeInsets.only(top: 10, right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text("Forget Password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF303030)
                  ),),
                onTap: ()=>{
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>ForgetPassword()
                  ))
                },
              ),
            ),
            GestureDetector(
              onTap: ()=>{
                FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: pwdcontroller.text).then(
                        (value) {
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context) => AdminHomePage()
                      ));

                    })

              },
              child: Container(
                margin: EdgeInsets.only(right: 40, top: 20,left: 40),
                // padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors:  [(new Color(0xFF64B5F6)),(new Color(0xFF01579B))],
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
                child: Text("LOGIN",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 25),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text("don't have Account? "),
            //       GestureDetector(
            //         onTap: ()=>{
            //           Navigator.push(context, MaterialPageRoute(
            //               builder:(context) => SignUpScreen()
            //           ))
            //         },
            //         child: Text("Register Now",
            //           style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               color: Color(0xFF303030)
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
