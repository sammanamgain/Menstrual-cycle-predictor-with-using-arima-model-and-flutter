import 'package:flutter/material.dart';
import 'package:menstrual_period_tracker/auth_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();

    List images = ["g.png", "t.png", "f.png"];
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/signup.png"),
                fit: BoxFit.cover,
              )),
              child: Column(children: [
                SizedBox(
                  height: h * 0.15,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/profile.png"),
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
                              color: Colors.deepOrangeAccent,
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
                              color: Colors.deepOrangeAccent,
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
                        "दर्ता गर्नुहोस ",
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
                RichText(
                  text: TextSpan(
                    text: "अथवा तल का प्रक्रिया मार्फत साइन गर्नुहोस ",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  ),
                ),
              ],
            ),
            Center(
              child: Wrap(
                children: List<Widget>.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[500],
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  // ignore: prefer_interpolation_to_compose_strings
                                  AssetImage("assets/images/" + images[index]),
                            ),
                          ),
                        )),
              ),
            )
          ]),
        ));
  }
}
