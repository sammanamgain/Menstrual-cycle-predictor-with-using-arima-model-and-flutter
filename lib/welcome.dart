import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:menstrual_period_tracker/auth_controller.dart';
import 'package:menstrual_period_tracker/input/input1.dart';
import 'package:menstrual_period_tracker/loginsignup/loginsignup.dart';

// ignore: must_be_immutable
class Welcome extends StatelessWidget {
  String? email;

  Welcome({super.key, this.email = 'defualt'});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: w,
              height: h * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/bb.png"),
                fit: BoxFit.cover,
              )),
              child: Column(children: [
                SizedBox(
                  height: h * 0.10,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 90,
                  backgroundImage: AssetImage("assets/images/gurl.png"),
                )
              ]), //one third of HEIGHT of the
            ),
            Container(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.07,
                      width: w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                    ),
                    SizedBox(
                      height: h * 0.03,
                      width: w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                    ),
                    SizedBox(
                      height: h * 0.03,
                      width: w,
                    ),
                  ],
                )),
            SizedBox(
              height: h * 0.07,
              width: w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                'हाम्रो अप्प्लिकेशन मा स्वागत छ ',
                style: GoogleFonts.getFont(
                  'Khand',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 5, 5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                email ?? "loading",
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: h * 0.07,
              width: w,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Picker(email));
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
                            "अर्को",
                            style: GoogleFonts.getFont(
                              'Khand',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 251, 248, 248),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Login());
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
                            "साइन आउट",
                            style: GoogleFonts.getFont(
                              'Khand',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 242, 241, 241),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ]),
        ));
  }
}
