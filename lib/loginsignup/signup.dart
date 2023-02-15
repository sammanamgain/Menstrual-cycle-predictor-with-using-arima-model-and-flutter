import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menstrual_period_tracker/auth_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              Color.fromARGB(255, 75, 10, 116), // set your desired color here
          title: Text(
            'दर्ता गर्नु',
            style: GoogleFonts.getFont(
              'Khand',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 248, 245, 245),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
                      child: TextField(
                        controller: emailcontroller,
                        // obscureText: true,
                        decoration: InputDecoration(
                            hintText: "तपाई को इमेल आईडी ",
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 126, 37, 158),
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
                              color: Color.fromARGB(255, 129, 42, 166),
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
                  onTap: () => AuthController.instance
                      .register(emailcontroller.text, passwordcontroller.text),
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
                        "दर्ता गर्नुहोस ",
                        style: GoogleFonts.getFont(
                          'Khand',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 246, 244, 244),
                        ),
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
          ]),
        ));
  }
}
