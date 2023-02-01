import 'dart:async';
//import 'package:menstrual_period_tracker/input1.dart';
//import 'package:menstrual_period_tracker/input2.dart';
import 'package:menstrual_period_tracker/input/age.dart';
import 'package:menstrual_period_tracker/loginsignup/loginsignup.dart';
import 'package:menstrual_period_tracker/screens/calendar.dart';
import 'package:menstrual_period_tracker/screens/content.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:menstrual_period_tracker/timerui.dart';
//import 'package:menstrual_period_tracker/signup.dart';
import 'package:menstrual_period_tracker/welcome.dart';
import 'package:flutter/material.dart';
import 'package:menstrual_period_tracker/main.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 0), () {
      Get.to(() => Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 150, 153, 153),
          child: Center(
            child: Image.asset(
              'assets/images/r.png',
              scale: 2.0,
            ),
          ), // <-- SEE HERE
        ),
      ),
    );
  }
}
