import 'package:flutter/material.dart';
import 'package:picozen/admin/userdetails.dart';

import 'admininstadd.dart';
class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: Text('Admin Panel'),
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            new ListTile(
              title: new Text("Home Page"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminHomePage()));
              },
            ),
            new ListTile(
              title: new Text("Add Institution"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InstitutionAddition()));
              },
            ),
            new ListTile(
              title: new Text("Remove Institute"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RemoveInstitue()));
              },
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text("Admin Panel"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
class DrawerCodeOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: Text('Smart Education'),
            decoration: new BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          new ListTile(
            title: new Text("Home Page"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminHomePage()));
            },
          ),
          new ListTile(
            title: new Text("Add Institution"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InstitutionAddition()));
            },
          ),
          new ListTile(
            title: new Text("Remove Institute"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RemoveInstitue()));
            },
          ),
        ],
      ),
    );
  }
}

