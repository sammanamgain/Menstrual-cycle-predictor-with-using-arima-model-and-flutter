import 'dart:async';
import 'package:menstrual_period_tracker/loginsignup/loginsignup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(_scaffoldKey.currentContext!,
          MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cc.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/profile1.png',
                scale: 2.0,
              ),
              const SizedBox(height: 16),
              Text(
                'तपाईंलाई मासिक वारीमा स्वागत छ',
                style: GoogleFonts.getFont(
                  'Khand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.8),
                      offset: Offset(2, 2),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
