import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:picozen/admin/admin_passcode.dart';
import 'package:picozen/institution/institution_passcode.dart';
import 'package:picozen/screens/admin.login.dart';
import 'package:picozen/screens/home_screen.dart';
import 'package:picozen/screens/inst_login.dart';
import 'package:picozen/screens/signin_screen.dart';
import 'package:picozen/screens/signup_screen.dart';

class ModuleScreen extends StatefulWidget {
  const ModuleScreen({Key? key}) : super(key: key);

  @override
  _ModuleScreenState createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
            width: 500,
            height: 890,
            fit: BoxFit.cover,
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen())),
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 400, 0, 0),
              child: SizedBox(
                height: 65,
                width: 180,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('Student'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InstPasscodeMyApp())),
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(210, 400, 5, 0),
              child: SizedBox(
                height: 65,
                width: 180,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('Institution'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasscodeMyApp())),
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(110, 480, 0, 0),
              child: SizedBox(
                height: 65,
                width: 180,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('Admin'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
