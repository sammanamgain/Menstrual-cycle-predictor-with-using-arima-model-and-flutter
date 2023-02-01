import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menstrual_period_tracker/screens/calendar.dart';
import 'package:menstrual_period_tracker/screens/content.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:menstrual_period_tracker/timerui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

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
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 20),
            child: Row(children: [
              const Text(
                'लक्षणहरू',
                style: TextStyle(fontSize: 20),
              )
            ]),
          ),
          Symptoms_Image(),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Row(children: [
              const Text(
                'रक्तश्राव',
                style: TextStyle(fontSize: 20),
              )
            ]),
          ),
          Bleeding_Image(),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Row(children: [
              const Text(
                'मूड',
                style: TextStyle(fontSize: 20),
              )
            ]),
          ),
          Mood_Image(),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Row(children: [
              const Text(
                'औषधी',
                style: TextStyle(fontSize: 20),
              )
            ]),
          ),
          Medicine_Image()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const MyApps());
                  },
                  child: const Icon(Icons.timer)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const Calendar());
                  },
                  child: const Icon(Icons.calendar_month)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const MyHomePage(
                          title: 'hh',
                        ));
                  },
                  child: const Icon(Icons.girl_sharp)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const Stat());
                  },
                  child: const Icon(Icons.auto_graph)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const Content());
                  },
                  child: const Icon(Icons.content_copy)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                  style: TextStyle(fontSize: 14),
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
                width: 60,
                height: 60,
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
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ])));
