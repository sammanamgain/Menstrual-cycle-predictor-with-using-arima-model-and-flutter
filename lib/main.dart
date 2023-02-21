import 'package:flutter/material.dart';
import 'package:menstrual_period_tracker/auth_controller.dart';
import 'package:menstrual_period_tracker/screens/calendar.dart';
import 'package:menstrual_period_tracker/timerui.dart';
import './splash.dart';
import 'loginsignup/loginsignup.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
//import './home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase bata aaune controller lai wait garxa binding hune bela samma
  //tala ko line le chai auth controlle  lai jata bata ne access garna dinxa
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(
      const GetMaterialApp(debugShowCheckedModeBanner: false, home: Splash()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mahina Wari',
      //theme: ThemeData(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Mahina Wari'),
            centerTitle: true,
            leading: Image.asset(
              'assets/images/Applogo.png', // Replace with the path to your app icon
            ),
          ),
          body: Column(
            children: [
              Login(),
            ],
          )),
    );
  }
}
