import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:menstrual_period_tracker/input/input2.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_utils/nepali_utils.dart';

class Picker extends StatefulWidget {
  final String? email;
  Picker(this.email);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
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

  String formatDate(DateTime dateTime) => DateFormat("MMMM d").format(dateTime);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final formatter = NepaliDateFormat('yyyy-MM-dd');
    final formatted = formatter.format(_dateTime);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cc.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/gurl.png',
                scale: 3.0,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: h * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "तपाई को पछिलो महिनावारी कहिले सुरु भएको थियो ?",
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
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: _showdatepicker,
                      child: Padding(
                        padding: EdgeInsets.all(10),
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
                              "'मिति छान्नुहोस ' ",
                              style: GoogleFonts.getFont(
                                'Khand',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 247, 244, 244),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                      width: w,
                    ),
                    Text(
                      formatted.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 71, 24, 159),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        createUser(formatted.toString(), widget.email);
                        Get.to(() => Days(widget.email));
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
                              color: Color.fromARGB(255, 247, 244, 244),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future createUser(String dateValue, String? email) async {
  final docUser =
      FirebaseFirestore.instance.collection('User Details').doc(email);

  final firstData = {'Period Date': dateValue};
  await docUser.set(firstData);
}
