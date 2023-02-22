import 'dart:async';
import 'dart:ui';
import 'retrive/retrievedata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menstrual_period_tracker/screens/calendar.dart';
import 'package:menstrual_period_tracker/screens/content.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:menstrual_period_tracker/symptoms.dart';

import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_utils/nepali_utils.dart';

import 'loginsignup/signup.dart';

class MyApps extends StatefulWidget {
  final String? email;
  MyApps(this.email);

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  NepaliDateTime _dateTime = NepaliDateTime.now();
  void _showdatepicker(String? periodDate) async {
    await showMaterialDatePicker(
      context: context,
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(2078),
      lastDate: NepaliDateTime(2090),
    ).then((value) {
      if (value == null) {
        print('Date picker was cancelled');
        return;
      }
      NepaliDateTime? updatevalue = NepaliDateTime.tryParse(value.toString());
      setState(() {
        _dateTime = updatevalue!;
        NepaliUnicode.convert('value');
      });
      //'${now.year}-${now.month}-${now.day}'
      NepaliDateTime? date2;
      if (periodDate != null) {
        date2 = NepaliDateTime.parse(periodDate);
      } else {}

      NepaliDateTime now = NepaliDateTime.now();
      Duration difference = _dateTime.difference(date2!);
      int cycleLength = difference.inDays;
      print(
          'The value of date2! is ${date2.year} - ${date2.month} - ${date2.day}');
      print('The value of cycleLength is $cycleLength');
      addCycleData(
          widget.email, cycleLength, '${now.year}-${now.month}-${now.day}');
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "टाइमर",
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
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: h * 0.10,
                width: w,
              ),
              Center(
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 12, 12, 12),
                    radius: 155,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 154, 58, 58),
                      radius: 150,
                      child: FutureBuilder<User?>(
                          future: readUser(widget.email),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final user = snapshot.data!;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Text(
                                      "महिनावारी आउन बाँकी दिन",
                                      style: GoogleFonts.getFont(
                                        'Khand',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 5, 5, 5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                    width: w,
                                  ),
                                  Text(
                                    '${user.cycleLength}',
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                                ],
                              );
                            } else {
                              return Text('Something is wrong');
                            }
                          }), //Text
                    ),
                  ), //CircleAvatar
                ),
              ),
              SizedBox(
                height: h * 0.06,
                width: w,
              ),
              FutureBuilder<User?>(
                  future: readUser(widget.email),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final user = snapshot.data!;
                      return Container(
                        width: w * 0.7,
                        height: h * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'महिनावारीको मिति परिवर्तन गर्न',
                              style: GoogleFonts.getFont(
                                'Khand',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 5, 5),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(39, 3, 27, 0.686),
                              ),
                              onPressed: () {
                                _showdatepicker(user.periodDate);
                              },
                              child: Center(
                                child: Text(
                                  "मिति छान्नु होस्",
                                  style: GoogleFonts.getFont(
                                    'Khand',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 253, 250, 250),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Text("Something is Wrong");
                    }
                  }),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            backgroundColor: const Color.fromARGB(255, 66, 13, 106),
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

class User {
  String? periodDate;
  String? cycleLength;
  String? periodLength;
  int? age;

  User({
    this.periodDate,
    this.cycleLength,
    this.periodLength,
    this.age,
  });

  Map<String, dynamic> toDetails() {
    return {
      'Age': age,
      'Cycle Length': cycleLength,
      'Period Date': periodDate,
      'Period Length': periodLength,
    };
  }

  static User fromDatabase(Map<String, dynamic> details) {
    return User(
        age: details['Age'],
        cycleLength: details['Cycle Length'],
        periodDate: details['Period Date'],
        periodLength: details['Period Length']);
  }
}

Stream<List<User>> readUsers() => FirebaseFirestore.instance
    .collection('User Details')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => User.fromDatabase(doc.data())).toList());

Future<User?> readUser(String? email) async {
  final docUser =
      FirebaseFirestore.instance.collection('User Details').doc(email);
  final snapshot = await docUser.get();

  if (snapshot.exists) {
    return User.fromDatabase(snapshot.data()!);
  }
}
