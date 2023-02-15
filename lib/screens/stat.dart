import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../symptoms.dart';
import '../timerui.dart';
import 'calendar.dart';
import 'content.dart';

class Stat extends StatefulWidget {
  final String? email;
  Stat(this.email);

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "सांख्यिकी",
            style: GoogleFonts.getFont(
              'Khand',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 253, 250, 250),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 66, 13, 106),
          toolbarHeight: 80,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: [
          Column(
            children: [
              Card(
                elevation: 2,
                child: SizedBox(
                  height: h * 0.1,
                  width: w,
                  child: Center(
                      child: Text(
                    "तपाइको तथ्याङ्क",
                    style: GoogleFonts.getFont(
                      'Khand',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 5, 5),
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: h * 0.1,
                width: w,
                child: Center(
                    child: Text(
                  "तपाइको औसत महिनावारी  चक्र",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                )),
              ),
              Stack(children: [
                Center(
                  child: SizedBox(
                      height: h * 0.2,
                      width: w * 0.4,
                      child: const CircularProgressIndicator(
                        value: 1,
                        color: Colors.red,
                        backgroundColor: Colors.green,
                        strokeWidth: 10,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        " 24",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "दिनहरू",
                        style: GoogleFonts.getFont(
                          'Khand',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 5, 5),
                        ),
                      ),
                    ],
                  )),
                ),
              ]),
              SizedBox(
                height: h * 0.07,
                width: w,
              ),
              SizedBox(
                height: h * 0.07,
                width: w,
                child: Center(
                    child: Text(
                  "तपाइको औसत महिनावारी  अवधि",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                )),
              ),
              Stack(children: [
                Center(
                  child: SizedBox(
                      height: h * 0.2,
                      width: w * 0.4,
                      child: const CircularProgressIndicator(
                        value: 0.2,
                        color: Colors.red,
                        backgroundColor: Colors.green,
                        strokeWidth: 10,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Center(
                      child: Column(
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        " 4",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " दिनहरू",
                        style: GoogleFonts.getFont(
                          'Khand',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 5, 5),
                        ),
                      ),
                    ],
                  )),
                ),
              ])
            ],
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
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
      ),
    );
  }
}
