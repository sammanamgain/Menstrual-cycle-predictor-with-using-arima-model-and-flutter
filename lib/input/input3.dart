import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
            "तपाई को महिनावारी को आबधि कति लामो हुन्छ ? ",
            style: TextStyle(
                color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: _currentSliderValue,
            max: 10,
            divisions: 10,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Text(
            _currentSliderValue.toString(),
            style: const TextStyle(color: Colors.pink, fontSize: 20),
          ),
          SizedBox(
            width: w,
            height: h * 0.1,
          ),
          GestureDetector(
            onTap: () {
              createUser(_currentSliderValue.toString(),widget.email);
              Get.to(() => Age(widget.email));
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

Future createUser(String lengthValue,String? email) async
{
  final docUser = FirebaseFirestore.instance.collection('User Details').doc(email);

  final firstData = 
  {
    'Period Length': lengthValue
  };
  await docUser.update(firstData);
}