import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup.dart';
import '../auth_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
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
              height: h * 0.3,
              child: ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bb.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  children: [
                    const Text(
                      "नमस्ते",
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "आफ्नो खाता मा साइन गर्नु होस् ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 9, 9, 9)),
                    ),
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
                      child: TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            hintText: "तपाई को इमेल आईडी ",
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 94, 25, 128),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(60, 14, 14, 14))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
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
                      child: TextField(
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "पासवोर्ड ",
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Color.fromARGB(255, 99, 24, 153),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white24)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                      width: w,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w * 0.5,
                        ),
                        const Text(
                          "पस्स्वोर्ड बिर्सिनु भयो ? ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: h * 0.07,
              width: w,
            ),
            Row(
              children: [
                SizedBox(
                  height: h * 0.08,
                  width: w * 0.25,
                ),
                GestureDetector(
                  onTap: (() => AuthController.instance
                      .login(emailcontroller.text, passwordcontroller.text)),
                  child: Container(
                    width: w * 0.4,
                    height: h * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/bb.png"),
                          fit: BoxFit.cover,
                        )),
                    child: const Center(
                      child: Text(
                        "साइन गर ",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ), //one third of HEIGHT of the
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.04,
              width: w,
            ),
            Row(
              children: [
                SizedBox(
                  width: w * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: RichText(
                    text: TextSpan(
                      text: "तपाई संग खाता छैन ? ",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 15, 14, 14),
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => const SignUp()),
                          text: "खोल्नुहोस ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.8, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
