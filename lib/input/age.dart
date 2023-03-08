import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menstrual_period_tracker/timerui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/database.dart';
import 'input2.dart';

class Age extends StatefulWidget {
  final String? email;
  Age(this.email);

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: w,
                height: h * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bb.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 90.0),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 90,
                    backgroundImage: AssetImage("assets/images/gurl.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: w,
            height: h * 0.1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "तपाई को उमेर कति हो ?  ",
              style: GoogleFonts.getFont(
                'Khand',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.white.withOpacity(0.8),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Color.fromARGB(255, 93, 23, 108),
              activeTrackColor: Color.fromARGB(255, 77, 15, 139),
              inactiveTrackColor: Color.fromARGB(255, 226, 30, 30),
              overlayColor: Color.fromARGB(255, 100, 9, 131).withOpacity(0.5),
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 15.0,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 30.0,
              ),
            ),
            child: Slider(
              value: _currentSliderValue,
              max: 40,
              divisions: 40,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          Text(
            _currentSliderValue.toString(),
            style: const TextStyle(
              color: Color.fromARGB(255, 11, 11, 11),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: w,
            height: h * 0.1,
          ),
          GestureDetector(
            onTap: () async {
              createUser(_currentSliderValue.toInt(), widget.email);
              //RetrieveData? x = await retrieveUserData(widget.email!);
              // print("printing age");

              //  print(x?.age);
              // print("printing cyclelength");

              //   print(x?.cycleLength);
              Get.to(() => MyApps(widget.email));
            },
            child: Container(
              width: w * 0.4,
              height: h * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/bb.png"),
                    fit: BoxFit.cover,
                  )),
              child: const Center(
                child: Text(
                  "अर्कों ",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ), //one third of HEIGHT of the
            ),
          ),
        ],
      ),
    );
  }
}

Future createUser(int ageValue, String? email) async {
  final docUser =
      FirebaseFirestore.instance.collection('User Details').doc(email);

  final firstData = {'Age': ageValue};
  await docUser.update(firstData);
}
