import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menstrual_period_tracker/input/age.dart';
import 'package:menstrual_period_tracker/timerui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'input2.dart';

class Length extends StatefulWidget {
  final String? email;
  Length(this.email);

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
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
              "तपाई को महिनावारी को आबधि कति लामो हुन्छ ? ",
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
          Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  thumbColor: Color.fromARGB(255, 93, 23, 108),
                  activeTrackColor: Color.fromARGB(255, 77, 15, 139),
                  inactiveTrackColor: Color.fromARGB(255, 226, 30, 30),
                  overlayColor:
                      Color.fromARGB(255, 100, 9, 131).withOpacity(0.5),
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
                onTap: () {
                  createUser(_currentSliderValue.toString(), widget.email);
                  Get.to(() => Age(widget.email));
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
                  child: Center(
                    child: Text(
                      "अर्कों ",
                      style: GoogleFonts.getFont(
                        'Khand',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 237, 237),
                      ),
                    ),
                  ), //one third of HEIGHT of the
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future createUser(String lengthValue, String? email) async {
  final docUser =
      FirebaseFirestore.instance.collection('User Details').doc(email);

  final firstData = {'Period Length': lengthValue};
  await docUser.update(firstData);
}
