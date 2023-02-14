import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        backgroundColor: Colors.pink[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/r.png',
                scale: 2.0,
              ),
              SizedBox(
                height: h * 0.3,
                width: w,
              ),
              const Text(
                "तपाई को पछिलो महिनावारी कहिले सुरु भएको थियो ?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: _showdatepicker,
                // Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'मिति छान्नुहोस ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
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
                    color: Colors.pink,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  createUser(formatted.toString(),widget.email);
                  Get.to(() => Days(widget.email));
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
          // ignore: prefer_const_literals_to_create_immutables
        ));
  }

}


Future createUser(String dateValue,String? email) async
{
  final docUser = FirebaseFirestore.instance.collection('User Details').doc(email);

  final firstData = 
  {
    'Period Date': dateValue
  };
  await docUser.set(firstData);
}