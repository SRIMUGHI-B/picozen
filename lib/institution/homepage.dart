import 'package:flutter/material.dart';

import 'addlab.dart';
import 'institution_profile.dart';
class InstitutionHomePage extends StatefulWidget {
  const InstitutionHomePage({Key? key}) : super(key: key);

  @override
  _InstitutionHomePageState createState() => _InstitutionHomePageState();
}

class _InstitutionHomePageState extends State<InstitutionHomePage> {
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
                    MaterialPageRoute(builder: (context) => InstitutionHomePage()));
              },
            ),
            new ListTile(
              title: new Text("Add Lab"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddLab()));
              },
            ),
            new ListTile(
              title: new Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InstitutionProfile()));
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
                  MaterialPageRoute(builder: (context) => InstitutionHomePage()));
            },
          ),
          new ListTile(
            title: new Text("Add Institution"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddLab()));
            },
          ),
          new ListTile(
            title: new Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InstitutionProfile()));
            },
          ),
        ],
      ),
    );
  }
}
