import 'package:flutter/material.dart';
import 'package:menstrual_period_tracker/auth_controller.dart';

class Welcome extends StatelessWidget {
  String ? email;
  
  Welcome({super.key, this.email='defualt'});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/signup.png"),
              fit: BoxFit.cover,
            )),
            child: Column(children: [
              SizedBox(
                height: h * 0.15,
              ),
              CircleAvatar(
                backgroundColor: Colors.white70,
                radius: 60,
                backgroundImage: AssetImage("assets/images/profile.png"),
              )
            ]), //one third of HEIGHT of the
          ),
          Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 20, right: 20),
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
                              offset: Offset(1, 1),
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
              "हाम्रो अप्प्लिकेशन मा स्वागत छ ",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(left: 50),
         
            child: Text(
              email ??"loading",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
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
                onTap: () {
                  AuthController.instance.logout();
                },
                child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage("assets/images/loginbtn.png"),
                        fit: BoxFit.cover,
                      )),
                  child: Center(
                    child: Text(
                      "साइन आउट",
                      style: TextStyle(fontSize: 32, color: Colors.white),
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
                width: w * 0.10,
              ),
            ],
          ),
        ]));
  }
}
