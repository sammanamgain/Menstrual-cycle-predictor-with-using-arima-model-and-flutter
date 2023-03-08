import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:menstrual_period_tracker/data/database.dart';
import 'input2.dart';

class Picker extends StatefulWidget {
  final String? email;
  Picker(this.email);
  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  NepaliDateTime _selectedDate = NepaliDateTime.now();

  //String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
  // You can set an initial value for the date if you like

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bb.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "तपाई को पछिलो महिनावारी कहिले सुरु भएको थियो ? ",
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
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () async {
              NepaliDateTime? picked = await showMaterialDatePicker(
                context: context,
                firstDate: NepaliDateTime(2000),
                lastDate: NepaliDateTime(2090),
                initialDate: _selectedDate,
              );
              if (picked != null && picked != _selectedDate) {
                //updatevalue = NepaliDateTime.tryParse(_selectedDate.toString());
                setState(() {
                  _selectedDate = picked;
                });
              }
            },
            child: Column(
              children: [
                Center(
                  child: Text(
                    "मिति छान्नुहोस ",
                    style: GoogleFonts.getFont(
                      'Khand',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.2,
            width: w,
          ),
          Text(
            DateFormat('yyyy-MM-dd').format(_selectedDate),
            style: TextStyle(fontSize: 24),
          ),
          GestureDetector(
            onTap: () {
              addPeriodDate(
                  widget.email, DateFormat('yyyy-MM-dd').format(_selectedDate));
              // createUser(
              //     DateFormat('yyyy-MM-dd').format(_selectedDate), widget.email);
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
    );
  }
}
// Future createUser(String dateValue, String? email) async {
//   final docUser =
//   FirebaseFirestore.instance.collection('User Details').doc(email);
//
//    final firstData = {'Initial Period Date': dateValue};
//   addPeriodDate(email, dateValue);
//   await docUser.set(firstData);
// }

// Future createUser(String dateValue, String? email) async {
//   final docUser =
//       FirebaseFirestore.instance.collection('User Details').doc(email);
//
//   final firstData = {'Period Date': dateValue};
//   await docUser.set(firstData);
// }
