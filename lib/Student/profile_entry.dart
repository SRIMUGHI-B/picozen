import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class ProfileEntry extends StatelessWidget {

  ProfileEntry({Key? key}) : super(key: key);
  TextEditingController fnamecontroller = TextEditingController();
   TextEditingController emailcontroller = TextEditingController();
   TextEditingController lnamecontroller = TextEditingController();
   TextEditingController agecontroller = TextEditingController();
   TextEditingController datecontroller = TextEditingController();
   TextEditingController branchcontroller = TextEditingController();
   TextEditingController degreecontroller = TextEditingController();
   TextEditingController schoolcontroller = TextEditingController();
   TextEditingController citycontroller = TextEditingController();
   CollectionReference Register = FirebaseFirestore.instance.collection('Register');

   Future<void> addUser() {
     return FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.uid.toString() ?? " ").add({
       'fname': fnamecontroller.text, // John Doe
       'lname': lnamecontroller.text, // Stokes and Sons
       'email': emailcontroller.text,
       'age': agecontroller.text,
       'date': datecontroller.text,
       'branch': branchcontroller.text,
       'degree': degreecontroller.text,
       'school': schoolcontroller.text,
       'city': citycontroller.text,
     })
         .then((value) => print("User Added"))
         .catchError((error) => print("Failed to add user: $error"));
     // Call the user's CollectionReference to add a new user
     // return Register
     //     .add({
     //   'fname': fnamecontroller.text, // John Doe
     //   'lname': lnamecontroller.text, // Stokes and Sons
     //   'email': emailcontroller.text,
     //   'age': agecontroller.text,
     //   'date': datecontroller.text,
     //   'branch': branchcontroller.text,
     //   'degree': degreecontroller.text,
     //   'school': schoolcontroller.text,
     //   'city': citycontroller.text,
     // })
     //     .then((value) => print("User Added"))
     //     .catchError((error) => print("Failed to add user: $error"));
   }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                  gradient: LinearGradient(colors:  [(new Color(0xFF64B5F6)),(new Color(0xFF01579B))],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  ),

                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,top: 40),
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
                            size: 20,
                          ),
                          hintText: "First name",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,top: 15),
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
                      controller: lnamecontroller,
                      cursorColor: Color(0xDD000000),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xDD000000),
                            size: 20,
                          ),
                          hintText: "Last name",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,top: 15),
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
                      controller: datecontroller,
                      cursorColor: Color(0xDD000000),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.date_range_sharp,
                            color: Color(0xDD000000),
                            size: 20,
                          ),
                          hintText: "Date of birth",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,top: 15),
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
                      controller: agecontroller,
                      cursorColor: Color(0xDD000000),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xDD000000),
                            size: 20,
                          ),
                          hintText: "Gender",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,top: 15),
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
                            Icons.email,
                            color: Color(0xDD000000),
                            size: 20,
                          ),
                          hintText: "Email Id",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,top: 15),
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
                      controller: schoolcontroller,
                      cursorColor: Color(0xDD000000),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.school_sharp,
                            color: Color(0xDD000000),
                            size: 20,
                          ),
                          hintText: "School/Institution name",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 15, 0, 0),

                        height: 49,
                        width: 170,
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
                          controller: degreecontroller,
                          cursorColor: Color(0xDD000000),
                          decoration: InputDecoration(
                              icon: Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                child: Icon(
                                  Icons.save_as_rounded,
                                  color: Color(0xDD000000),
                                  size: 20,
                                ),
                              ),
                              hintText: "Degree",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        height: 49,
                        width: 170,
                        margin:EdgeInsets.fromLTRB(10, 15, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200],
                          boxShadow: [BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE)
                          )],
                        ),
                        child: TextField(
                          controller: branchcontroller,
                          cursorColor: Color(0xDD000000),
                          decoration: InputDecoration(
                              icon: Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                child: Icon(
                                  Icons.vertical_split,
                                  color: Color(0xDD000000),
                                  size: 20,
                                ),
                              ),
                              hintText: "Branch",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none
                          ),
                        ),
                      ),

                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,top: 15),
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
                      controller: citycontroller,
                      cursorColor: Color(0xDD000000),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.location_city_rounded,
                            color: Color(0xDD000000),
                            size: 20,
                          ),
                          hintText: "City",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>{
                      addUser(),
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const StudentHomePage()),
                      ),

                      print("Registered")

                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
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
                      child: Text("Register",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),
                ],


              )
            ],
          ),
        ),
      ),


    );
  }
}