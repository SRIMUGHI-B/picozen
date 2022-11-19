import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picozen/Student/profile_entry.dart';

class UserModel{
  String? _fname;
  String? _lname;
  String? _school;
  String? _date;
  String? _age;
  String? _email;
  String? _degree;
  String? _branch;
  String? _city;


  String? get fname => _fname;

  set fname(String? value) {
    _fname = value;
  }
  String? get city => _city;

  set city(String? value) {
    _city = value;
  }
  String? get degree => _degree;

  set degree(String? value) {
    _degree = value;
  }
  String? get age => _age;

  set age(String? value) {
    _age = value;
  }
  String? get branch => _branch;

  set branch(String? value) {
    _branch = value;
  }

  UserModel(this._fname, this._lname, this._school, this._date, this._email,this._degree, this._branch,this._age,this._city);

  String? get lname => _lname;

  set lname(String? value) {
    _lname = value;
  }
  String? get date => _date;

  set date(String? value) {
    _date = value;
  }
  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get school => _school;

  set school(String? value) {
    _school = value;
  }

  UserModel.empty();
}

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}


class _StudentProfileState extends State<StudentProfile> {
  dynamic data;
  UserModel user = UserModel.empty();

  Future<dynamic> getData() async {

    final QuerySnapshot document = await  FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.uid.toString() ?? " ").get();

    var res = document.docs;
    for(var i in res){
      user = UserModel(i["fname"], i["lname"], i["school"],i["date"],i["email"],i["degree"],i["branch"],i["age"],i["city"]);
    }
    setState(() {

    });



    // await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
    //   setState(() {
    //     data =snapshot.data;
    //   });
    // });
  }
  @override
  void initState() {

    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body:SingleChildScrollView(
              child:Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10,50,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(108,12,0,0),
                          child: Text('Profile',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),


                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(110,12,0,0),
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  ProfileEntry()),
                              ),
                            },
                            child: Text('Edit',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(147,10,0,25),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://thumbs.dreamstime.com/b/high-school-student-29699566.jpg'),

                          radius: 45,
                        ),
                      ),

                    ],
                  ),


                  Container(
                    height: 60,
                    width: 350,
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(199, 194, 194, 0.2)
                      )],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,0,0),
                          child: Text('First name',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text(user.fname.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 350,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(199, 194, 194, 0.2)
                      )],

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,0,0),
                          child: Text('Last name',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text(user.lname.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 350,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(199, 194, 194, 0.2)
                      )],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,0,0),
                          child: Text('Date of birth',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text(user.date.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 350,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(199, 194, 194, 0.2)

                      )],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,0,0),
                          child: Text('Gender',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text(user.age.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 350,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(199, 194, 194, 0.2)
                      )],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,0,0),
                          child: Text('Email id',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text(user.email.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 350,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(199, 194, 194, 0.2)
                      )],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,0,0),
                          child: Text('School/Institution name',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text(user.school.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          height: 60,
                          width: 140,
                          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(199, 194, 194, 0.2)
                            )],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15,10,0,0),
                                child: Text('Degree',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                child: Text(user.degree.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                            ],
                          )
                      ),
                      Container(
                          height:60,
                          width: 195,
                          margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(199, 194, 194, 0.2)
                            )],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15,10,0,0),
                                child: Text('Branch',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                child: Text(user.branch.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),

                    ],

                  ),
                  Container(
                    height: 60,
                    width: 350,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(199, 194, 194, 0.2)
                      )],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,0,0),
                          child: Text('City',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text(user.city.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),









                ],
              ),
            )
        )
    );
  }
}


