import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menstrual_period_tracker/screens/timer.dart';

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TimerController());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
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
      backgroundColor: Color.fromARGB(255, 160, 75, 103),
      body: Column(
        children: [
          SizedBox(
            height: h * 0.3,
            width: w,
          ),
          Center(
            child: Obx(() => Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remaining days",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: h * 0.03,
                          width: w,
                        ),
                        Text(
                          '${controller.time.value}',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ), //Text
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
                "Timer",
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
            ), //one third of HEIGHT of the
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: '',
              backgroundColor: Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '',
            backgroundColor: Color.fromARGB(255, 177, 128, 144),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.girl_sharp),
            label: '',
            backgroundColor: Color.fromARGB(255, 177, 128, 144),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: '',
            backgroundColor: Color.fromARGB(255, 177, 128, 144),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_copy),
            label: '',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
