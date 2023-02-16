import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:url_launcher/url_launcher.dart';
import '../contents/content_one.dart';

import '../symptoms.dart';
import '../timerui.dart';
import 'calendar.dart';

class Content extends StatefulWidget {
  final String? email;
  Content(this.email);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    int? h1 = 50;

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "जानकारी",
          style: GoogleFonts.getFont(
            'Khand',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 253, 250, 250),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 66, 13, 106),
        toolbarHeight: 80,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content1(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 1,
                    image: AssetImage("assets/images/c1.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                //   color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Padding(
                  padding: EdgeInsets.only(top: 200, left: 80),
                  child: Text(
                    "Your Menstural Cycle ",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        height: 2,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content1(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 1,
                    image: AssetImage("assets/images/youn.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),

                // color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Text(
                    "महिनावारी रोकियो ? अरु कारण पनि हुन सक्छन् ",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        height: 2,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content1(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 1,
                    image: AssetImage("assets/images/period.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),

                // color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Text(
                    "महिनावरी सम्बन्धी केही भ्रम र वास्तविकता ",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        height: 2,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content1(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 1,
                    image: AssetImage("assets/images/youn.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),

                // color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Text(
                    " ",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        height: 2,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content1(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Container(
                color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Center(
                  child: Text(
                    "Your Menstural Cycle ",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              color: Colors.pink[50],
              height: h * 0.3,
              width: w,
              child: const Center(
                child: Text(
                  "Your Menstural Cycle ",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        backgroundColor:
            Color.fromARGB(255, 66, 13, 106), // set background color
        type: BottomNavigationBarType.fixed, // set type to fixed
        selectedItemColor: Colors.white, // set selected item color
        unselectedItemColor: Colors.grey[400], // set unselected item color
        iconSize: 30, // set icon sizeincrease the size of the icons
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Get.to(() => MyApps(widget.email));
              },
              child: const Icon(Icons.timer),
            ),
            label: '',
            backgroundColor: const Color.fromARGB(255, 66, 13, 106),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Get.to(() => Calendar(widget.email));
              },
              child: const Icon(Icons.calendar_month),
            ),
            label: '',
            backgroundColor: const Color.fromARGB(255, 66, 13, 106),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Get.to(() => MyHomePage(widget.email));
              },
              child: const Icon(Icons.girl_sharp),
            ),
            label: '',
            backgroundColor: const Color.fromARGB(255, 66, 13, 106),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Get.to(() => Stat(widget.email));
              },
              child: const Icon(Icons.auto_graph),
            ),
            label: '',
            backgroundColor: const Color.fromARGB(255, 66, 13, 106),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Get.to(() => Content(widget.email));
              },
              child: const Icon(Icons.content_copy),
            ),
            label: '',
            backgroundColor: const Color.fromARGB(255, 66, 13, 106),
          ),
        ],
      ),
    ));
  }
}
