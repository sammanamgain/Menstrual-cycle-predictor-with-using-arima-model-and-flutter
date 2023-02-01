import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menstrual_period_tracker/screens/calendar.dart';
import 'package:menstrual_period_tracker/screens/content.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:menstrual_period_tracker/symptoms.dart';
import 'package:menstrual_period_tracker/screens/timer.dart';

import 'loginsignup/signup.dart';

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TimerController());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}

// Home Page
class HomePage extends GetView<TimerController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      /*appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
                child: const Text(
              "Timer",
              style: TextStyle(color: Colors.black),
            ))),*/
      backgroundColor: Color.fromARGB(255, 255, 188, 211),
      body: Column(
        children: [
          SizedBox(
            height: h * 0.3,
            width: w,
          ),
          Center(
            child: Obx(() => Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 155,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 193, 192, 192),
                      radius: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18,8,8,8),
                            child: Text(
                              "महिनावारी आउन बाँकी दिन",
                              style: TextStyle(fontSize: 32,color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.03,
                            width: w,
                          ),
                          Text(
                            '${controller.time.value}',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ],
                      ), //Text
                    ),
                  ), //CircleAvatar
                )),
          ),
          SizedBox(
            height: h * 0.05,
            width: w,
          ),
          Container(
            width: w * 0.5,
            height: h * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),

              /*image: const DecorationImage(
                    image: AssetImage("assets/images/loginbtn.png"),
                    fit: BoxFit.cover,
                  )*/
            ),
            child: const Center(
              child: Text(
                "टाइमर",
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
            ), //one third of HEIGHT of the
          ),
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
                    Get.to(() => Content());
                  },
                  child: const Icon(Icons.content_copy)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
        ],
      ),
    );
  }
}
