import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
  void _showdatepicker() async {
  await showDatePicker(
    context: context,
    initialDate: NepaliDateTime.now(),
    firstDate: NepaliDateTime(2078),
    lastDate: NepaliDateTime.now(),
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
  });
}
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
            height: h * 0.25,
            width: w,
          ),
          Center(
            child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 155,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 193, 192, 192),
                      radius: 150,
                      child: FutureBuilder<User?>(
                        future: readUser(widget.email),
                        builder: (context, snapshot) {
                          if (snapshot.hasData){
                            final user = snapshot.data!;
                            return Column(
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
                                '${user.cycleLength}',
                                style: TextStyle(fontSize: 32, color: Colors.white),
                              ),
                            ],
                          );
                          }
                          else
                        {
                          return Text('Something is wrong');
                        }
                          
                        }
                        
                      ), //Text
                    ),
                  ), //CircleAvatar
                ),
          ),
          SizedBox(
            height: h * 0.06,
            width: w,
          ),
          Container(
            width: w * 0.5,
            height: h * 0.054,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue

              /*image: const DecorationImage(
                    image: AssetImage("assets/images/loginbtn.png"),
                    fit: BoxFit.cover,
                  )*/
            ),
            child:ElevatedButton(
              onPressed: _showdatepicker,
            child: const Center(
              child: Text(
                "टाइमर",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ), //one third of HEIGHT of the
          ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => MyApps(widget.email));
                  },
                  child: const Icon(Icons.timer)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() =>  Calendar(widget.email));
                  },
                  child: const Icon(Icons.calendar_month)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => MyHomePage(
                          widget.email
                        ));
                  },
                  child: const Icon(Icons.girl_sharp)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() =>  Stat(widget.email));
                  },
                  child: const Icon(Icons.auto_graph)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => Content(widget.email));
                  },
                  child: const Icon(Icons.content_copy)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
        ],
      ),
    );
  }
}


class User{
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
      periodLength: details['Period Length']
    );
  }
}

 Stream<List<User>> readUsers() => FirebaseFirestore
 .instance
 .collection('User Details')
 .snapshots()
 .map((snapshot) => snapshot.docs.map((doc) => User.fromDatabase(doc.data())).toList());

Future<User?> readUser(String? email) async{
  final docUser = FirebaseFirestore.instance.collection('User Details').doc(email);
  final snapshot = await docUser.get();

  if (snapshot.exists){
    return User.fromDatabase(snapshot.data()!);
  }
}








