import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:intl/intl.dart';

import 'data/database.dart';
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
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'loginsignup/signup.dart';
//import 'package:nepali_date_converter/nepali_date_converter.dart';

class MyApps extends StatefulWidget {
  final String? email;
  MyApps(this.email);

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  int? age;
  final _url = 'http://10.0.2.2:5000/forecast';
  NepaliDateTime previousDate = NepaliDateTime.now();
  DateTime previous = DateTime.now();

  //_makeForecast();

  NepaliDateTime _dateTime = NepaliDateTime.now();
  var impdata;
  void _showdatepicker(String Datevalue) async {
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
      //if (Datevalue != null) {
      date2 = NepaliDateTime.parse(Datevalue);
      //} else {}

      NepaliDateTime now = NepaliDateTime.now();
      Duration difference = _dateTime.difference(date2);
      int cycleLength = difference.inDays;
      addCycleData(
          widget.email, cycleLength, '${now.year}-${now.month}-${now.day}');
      //Below Function just Check Garna Ko lagi Banayeko
      addPeriodDate(widget.email,
          '${_dateTime.year}-${_dateTime.month}-${_dateTime.day}');
    });
  }

  String? result;
  var a = 0;

  void makeForecast() async {
    print("forecast function call vayo ");
    // Define the input data as a list of dictionaries
    var inputData = [
      {"date": 2022 - 01 - 01, "value": impdata, "age": age},
      {"date": 2022 - 02 - 01, "value": 28, "age": age},
      {"date": 2022 - 03 - 01, "value": 29, "age": age}
    ];
    print(impdata);

    // Send a POST request to the Flask API
    var response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'data': inputData}),
    );
    print("this line done");
    // Parse the response as a JSON string
    var responseData = json.decode(response.body);
    print(responseData);

    setState(() {
      result = responseData.toInt().toString();
      print(result);
    });
    print("setstate called");
    value = true;
  }

  var value = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    if (value == true) {
      print(_dateTime);
      Duration diff = _dateTime.difference(previousDate);
      int d = diff.inDays;
      print("printing difference");
      print(d);
      int x = int.parse(result!);
      int y = x - d;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collection = firestore.collection('User Details');

      DocumentReference document = collection.doc(widget.email);
      document.set({'Prediction': x}, SetOptions(merge: true));
      document.set({'Prediction Date': previousDate}, SetOptions(merge: true));

      if (y <= 0) {
        y = y * -1;
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
                  Container(
                    width: w * 0.7,
                    height: h * 0.4,
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 12, 12, 12),
                              radius: 155,
                              // child:
                              child: Column(
                                children: [
                                  Text("Peiod Running. Day is ${y.toString()}"),
                                ],
                              ),
                            ), //CircleAvatar
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.10,
                    width: w,
                  ),
                  SizedBox(
                    height: h * 0.06,
                    width: w,
                  ),
                  FutureBuilder<RetrieveData?>(
                      future: retrieveUserData(widget.email!),
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
                                    backgroundColor:
                                        Color.fromRGBO(39, 3, 27, 0.686),
                                  ),
                                  onPressed: () async {
                                    //    RetrieveData? x =
                                    await retrieveUserData(widget.email!);
                                    //  print(x?.age);

                                    //String Datevalues = retrievePeriodDates(widget.email).toString();
                                    // final String periodDate =
                                    //     await retrievePeriodDates2(widget.email);
                                    uilength(widget.email);
                                    // print(periodDate);
                                    //_showdatepicker(periodDate);
                                    //retrievePeriodDates(widget.email);
                                  },
                                  child: Center(
                                    child: Text(
                                      "मिति छान्नु होस्",
                                      style: GoogleFonts.getFont(
                                        'Khand',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 253, 250, 250),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Text("Loading Data");
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
      } else {
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
                  Container(
                    width: w * 0.7,
                    height: h * 0.4,
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 12, 12, 12),
                              radius: 155,
                              // child:
                              child: Text(y.toString()),
                            ), //CircleAvatar
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.10,
                    width: w,
                  ),
                  SizedBox(
                    height: h * 0.06,
                    width: w,
                  ),
                  FutureBuilder<RetrieveData?>(
                      future: retrieveUserData(widget.email!),
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
                                    backgroundColor:
                                        Color.fromRGBO(39, 3, 27, 0.686),
                                  ),
                                  onPressed: () async {
                                    //    RetrieveData? x =
                                    // await retrieveUserData(widget.email!);
                                    //  print(x?.age);

                                    //String Datevalues = retrievePeriodDates(widget.email).toString();
                                    final String periodDate =
                                        await retrievePeriodDates2(
                                            widget.email);
                                    uilength(widget.email);
                                    // print(periodDate);
                                    _showdatepicker(periodDate);
                                    //retrievePeriodDates(widget.email);
                                  },
                                  child: Center(
                                    child: Text(
                                      "मिति छान्नु होस्",
                                      style: GoogleFonts.getFont(
                                        'Khand',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 253, 250, 250),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Text("Loading Data");
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
    } else {
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
                FutureBuilder<RetrieveData?>(
                    future: retrieveUserData(widget.email!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final user = snapshot.data!;
                        print(user);

                        //   final user2 = snapshot.data!;
                        //    print("printing age");

                        age = user.age;
                        //    print(age);
                        //   print("printing cyclelength");
                        impdata = user.cycleLength;
                        //   print(impdata);
                        //     print("cyclelength");
                        print("printing date");
                        previousDate = NepaliDateTime.parse(user.periodDate!);
                        print(previousDate);
                        //    print(previousDate);

                        DateTime dt = previousDate.toDateTime();
                        previous = dt as DateTime;

                        String N = DateFormat('yyyy-MM-dd').format(previous);
                        //      print(previousDate);

                        makeForecast();

                        return Container(
                          width: w * 0.7,
                          height: h * 0.4,
                          child: Column(
                            //  mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 12, 12, 12),
                                    radius: 155,
                                    // child:
                                    child: Text(" LOADING DATA"),
                                  ), //CircleAvatar
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Text("Something is Wrong");
                      }
                    }),
                SizedBox(
                  height: h * 0.10,
                  width: w,
                ),
                SizedBox(
                  height: h * 0.06,
                  width: w,
                ),
                FutureBuilder<RetrieveData?>(
                    future: retrieveUserData(widget.email!),
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
                                  backgroundColor:
                                      Color.fromRGBO(39, 3, 27, 0.686),
                                ),
                                onPressed: () async {
                                  // RetrieveData? x =
                                  //     await retrieveUserData(widget.email!);
                                  // print(x?.age);

                                  //String Datevalues = retrievePeriodDates(widget.email).toString();
                                  // final String periodDate =
                                  //     await retrievePeriodDates2(widget.email);
                                  uilength(widget.email);
                                  // print(periodDate);
                                  //_showdatepicker(periodDate);
                                  //retrievePeriodDates(widget.email);
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
                        return Text("Loading Data");
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

Future<int> uilength(String? email) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final DocumentReference<Map<String, dynamic>> documentReference =
      _db.collection('User Details').doc(email);
  final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await documentReference.get();
  if (snapshot.exists) {
    final Map<String, dynamic> data = snapshot.data()!;
    final int prediction = data['Prediction'];
    final String periodDate = await retrievePeriodDates2(email);
    NepaliDateTime periodDates = NepaliDateTime.parse(periodDate);
    periodDates = periodDates.add(Duration(days: prediction));
    NepaliDateTime now = NepaliDateTime.now();
    String nows = '${now.year}-${now.month}-${now.day}';
    NepaliDateTime now2 = NepaliDateTime.parse(nows);
    int difference = periodDates.difference(now2).inDays;
    //int differenceInDays = (periodDates.compareTo(now));
    //difference = difference * differenceInDays;
    //print(difference);
    return difference;
  }
  return 0;
}
