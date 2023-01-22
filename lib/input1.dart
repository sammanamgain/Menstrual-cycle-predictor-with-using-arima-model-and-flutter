import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:menstrual_period_tracker/input2.dart';

class Picker extends StatefulWidget {
  const Picker({super.key});

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  DateTime _dateTime = DateTime.now();
  void _showdatepicker() async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2002),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  String formatDate(DateTime dateTime) => DateFormat("MMMM d").format(dateTime);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.black,
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
                    color: Colors.pink,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
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
                _dateTime.toString(),
                style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
                  GestureDetector(
                onTap: () {
                  Get.to(() => const Days());
                }
                ,
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
                      "साइन आउट",
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
