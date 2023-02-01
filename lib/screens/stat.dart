import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../symptoms.dart';
import '../timerui.dart';
import 'calendar.dart';
import 'content.dart';

class Stat extends StatefulWidget {
  const Stat({super.key});

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
          backgroundColor: Color.fromARGB(255, 255, 188, 211),
          title: const Text(
            "",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(children: [
          Column(
            children: [
              Card(
                elevation: 2,
                child: SizedBox(
                  height: h * 0.1,
                  width: w,
                  child: const Center(
                      child: Text(
                    "तपाइको तथ्याङ्क",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: h * 0.1,
                width: w,
                child: const Center(
                    child: Text(
                  "तपाइको औसत महिनावारी  चक्र",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    children: const [
                      Text(
                        " 24",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "दिनहरू",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
                child: const Center(
                    child: Text(
                  "तपाइको औसत महिनावारी  अवधि",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    children: const [
                      Text(
                        " 4",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " दिनहरू",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
              ])
            ],
          ),
        ]),
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
      ),
    );
  }
}
