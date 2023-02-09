import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menstrual_period_tracker/timerui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          Container(
            width: w,
            height: h * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/loginimg.png"),
              fit: BoxFit.cover,
            )), //one third of HEIGHT of the
          ),
          SizedBox(
            width: w,
            height: h * 0.2,
          ),
          const Text(
            "तपाई को उमेर कति हो ?  ",
            style: TextStyle(
                color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: _currentSliderValue,
            max: 50,
            divisions: 50,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Text(
            _currentSliderValue.toInt().toString(),
            style: const TextStyle(color: Colors.pink, fontSize: 20),
          ),
          SizedBox(
            width: w,
            height: h * 0.1,
          ),
          GestureDetector(
            onTap: () {
              createUser(_currentSliderValue.toInt(),widget.email);
              Get.to(() => MyApps(widget.email));
            },
            child: Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/loginbtn.png"),
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

Future createUser(int ageValue,String? email) async
{
  final docUser = FirebaseFirestore.instance.collection('User Details').doc(email);

  final firstData = 
  {
    'Age': ageValue
  };
  await docUser.update(firstData);
}