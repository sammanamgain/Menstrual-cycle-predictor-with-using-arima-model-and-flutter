import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:url_launcher/url_launcher.dart';
import '../contents/content_one.dart';
import '../contents/content_two.dart';
import '../contents/content_three.dart';
import '../contents/content_four.dart';
import '../contents/content_five.dart';
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
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        scale: 1,
                        image: AssetImage("assets/images/c1.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    height: h * 0.3,
                    width: w,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 17, 17, 17),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Center(
                        child: Text(
                          "माहिनावरी का वास्तविकताहरु ",
                          style: GoogleFonts.getFont(
                            'Khand',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 243, 239, 239),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content2(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        scale: 1,
                        image: AssetImage("assets/images/youn.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    height: h * 0.3,
                    width: w,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 15, 15, 15),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Center(
                        child: Text(
                          "महिनावारी रोकियो ? अरु कारण  ",
                          style: GoogleFonts.getFont(
                            'Khand',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 253, 250, 250),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content3(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        scale: 1,
                        image: AssetImage("assets/images/period.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    height: h * 0.3,
                    width: w,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 19, 19, 19),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Center(
                        child: Text(
                          "What is menstruation? ",
                          style: GoogleFonts.getFont(
                            'Khand',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 253, 250, 250),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content4(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        scale: 1,
                        image: AssetImage("assets/images/edu.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    height: h * 0.3,
                    width: w,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 11, 11, 11),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Center(
                        child: Text(
                          "Menstrual Cycle ",
                          style: GoogleFonts.getFont(
                            'Khand',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 243, 240, 240),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Content5(widget.email)),
              );
            },
            child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        scale: 1,
                        image: AssetImage("assets/images/pad.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    height: h * 0.3,
                    width: w,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 12, 12, 12),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Center(
                        child: Text(
                          "PMDD ",
                          style: GoogleFonts.getFont(
                            'Khand',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 253, 250, 250),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
