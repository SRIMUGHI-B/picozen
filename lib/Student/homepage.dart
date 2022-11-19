import 'package:flutter/material.dart';
import 'package:picozen/Student/statustab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picozen/Student/student_profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: Text('Picozen'),
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            new ListTile(
              title: new Text("Home Page"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentHomePage()));
              },
            ),
            new ListTile(
              title: new Text("Application Status"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentStatusTab()));
              },
            ),
            new ListTile(
              title: new Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentProfile()));
              },
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text("Picozen"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              width: 400,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),

                ),
                boxShadow: [BoxShadow(
                  color: Color(0xff1565c0),
                )],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40,65,0,3),
                    child: Text('HELLO 👋',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(30, 13, 0, 0),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(
                        color: Colors.white,
                      )],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,0,0,0),

                      child: SizedBox(
                        width: 310,
                        height: 40,

                        child: TextField(
                          cursorColor: Color(0xDD000000),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: Color(0xDD000000),
                              ),
                              hintText: "Search",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25,30,0,0),
              child: Text('Popular Courses',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            CarouselSlider(

              options: CarouselOptions(
                height: 260.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),

              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://i.ytimg.com/vi/bSNJE9C7vcg/maxresdefault.jpg"),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://www.aeccglobal.in/images/easyblog_articles/459/1-year-diploma-courses-after-12th-science.webp"),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://media.nngroup.com/media/courses/opengraph_images/Course_Social_Cards-11.png"),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://media.geeksforgeeks.org/wp-content/cdn-uploads/20210219205515/HTML-Workshop-FREE-Course-By-GeeksforGeks.png"),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://authindia.com/wp-content/uploads/2021/08/Art-Workshop-Course-Authindia.jpg"),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(25,30,0,0),
              child:   Text('Institutions',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("Ins_Register").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(snapshot.hasData) {
                      final snap = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: snap.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            highlightColor: Color.fromARGB(255, 188, 223, 255),
                            // onTap: (){
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => descriptionPage()),
                            //   );
                            //   print('clicked');
                            // },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                child: Container(
                                  height: 120,
                                  width:500,
                                  margin: EdgeInsets.fromLTRB(22, 20, 0, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    image: DecorationImage(image: AssetImage('assets/images/container.png'),
                                        alignment: Alignment.topRight,
                                        fit: BoxFit.fitHeight,
                                        opacity: 0.5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:0),
                                        child: Text(snap[index]['instname'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 0,top: 20),
                                        child: Text(snap[index]['city'],
                                          style: TextStyle(fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 115, 115, 115)),),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            )
          ],
        ),
      )
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
                  MaterialPageRoute(builder: (context) => StudentHomePage()));
            },
          ),
          new ListTile(
            title: new Text("Application Status"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentStatusTab()));
            },
          ),
          new ListTile(
            title: new Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentProfile()));
            },
          ),
        ],
      ),
    );
  }
}