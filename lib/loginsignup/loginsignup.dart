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
              decoration:const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/loginimg.png"),
                fit: BoxFit.cover,
              )), //one third of HEIGHT of the
            ),
            Container(
                color: Colors.white,
                margin:const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  children: [
                    const Text(
                      "नमस्ते",
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "आफ्नो खाता मा साइन गर्नु होस् ",
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
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
                                offset:const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            hintText: "तपाई को इमेल आईडी ",
                            prefixIcon:const Icon(
                              Icons.email,
                              color: Colors.deepOrangeAccent,
                            ),
                            focusedBorder:const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white24)),
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
                                offset:const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "पासवोर्ड ",
                            prefixIcon:const Icon(
                              Icons.password,
                              color: Colors.deepOrangeAccent,
                            ),
                            focusedBorder:const OutlineInputBorder(
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
                      const  Text(
                          "पस्स्वोर्ड बिर्सिनु भयो ? ",
                          style: TextStyle(
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
                    width: w * 0.5,
                    height: h * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image:const  DecorationImage(
                          image: AssetImage("assets/images/loginbtn.png"),
                          fit: BoxFit.cover,
                        )),
                    child:const  Center(
                      child: Text(
                        "साइन गर ",
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ), //one third of HEIGHT of the
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.07,
              width: w,
            ),
            Row(
              children: [
                SizedBox(
                  width: w * 0.3,
                ),
              
                RichText(
                  text: TextSpan(
                      text: "तपाई संग खाता छैन ? ",
                      style: TextStyle(color: Colors.grey[500], fontSize: 20),
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
                      ]),
                ),
              ],
            )
          ]),
        ));
  }
}
