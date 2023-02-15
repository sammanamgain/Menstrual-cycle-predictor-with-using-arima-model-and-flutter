import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menstrual_period_tracker/screens/calendar.dart';
import 'package:menstrual_period_tracker/screens/content.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:menstrual_period_tracker/timerui.dart';

class MyHomePage extends StatefulWidget {
  final String? email;
  MyHomePage(this.email);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "विकार सूचक ",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 20),
            child: Row(children: [
              Text(
                'लक्षणहरू',
                style: GoogleFonts.getFont(
                  'Khand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 5, 5),
                ),
              )
            ]),
          ),
          Symptoms_Image(),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Row(children: [
              Text(
                'रक्तश्राव',
                style: GoogleFonts.getFont(
                  'Khand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 5, 5),
                ),
              )
            ]),
          ),
          Bleeding_Image(),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Row(children: [
              Text(
                'मूड',
                style: GoogleFonts.getFont(
                  'Khand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 5, 5),
                ),
              )
            ]),
          ),
          Mood_Image(),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Row(children: [
              Text(
                'औषधी',
                style: GoogleFonts.getFont(
                  'Khand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 5, 5),
                ),
              )
            ]),
          ),
          Medicine_Image()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
            backgroundColor: Color.fromARGB(255, 245, 243, 247),
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
    );
  }
}

Widget Symptoms_Image() => Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Stress.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "तनाव भयो",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/moody.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "मुड",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/headache.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "टाउको दुख्ने",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Food Craving.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "खान मन लग्यो",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Abdominal Pain.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "पेट दुख्ने",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget Bleeding_Image() => Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/light.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "थोरै",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Normal.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "सामान्य",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/heavy.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "धेरै",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Irregular.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "असामान्य",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget Mood_Image() => Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Happy.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "खुसी",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Normi.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "सामान्य",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/annoyed.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "रिसाए",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Anxious.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "चिन्तित",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Energetic.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "सक्रिय",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Sad.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "दु:ख",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget Medicine_Image() => Container(
    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Medicine.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "औषधी",
                style: GoogleFonts.getFont(
                  'Khand',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 5, 5),
                ),
              ),
            ],
          ),
        ])));
