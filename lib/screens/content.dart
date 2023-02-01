import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:url_launcher/url_launcher.dart';

import '../symptoms.dart';
import '../timerui.dart';
import 'calendar.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    List<String> urlist = [
      "https://www.womenshealth.gov/menstrual-cycle/your-menstrual-cycle?fbclid=IwAR2IkbThjhfqUsZdT3J1WKHIGpRzQp99Uc5VRlZ6kiLUWmwwx1YBWuvQ4to",
      "https://www.onlinekhabar.com/2017/11/641385?fbclid=IwAR2MLdqEeLw34qDd0m5-kV5-TW6K0kLKeI0BkHZkOychWeFhM4TeFOfpQlk",
      "https://www.onlinekhabar.com/2013/09/119537?fbclid=IwAR2zuK5d7NH_p4B_gallqGvH_c9w7GwSRmznfdQe630uf-c4TdyJguyE1cQ"
    ];
    List<Uri> url = [];
    for (var string in urlist) {
      var uri = Uri.tryParse(
          string); //urlist vaneko string ko collection ho teslai uri ma convert gareko uri vankeo Uri object type data ho jun lai link jasto treat garxa
      if (uri != null) {
        url.add(uri);
      }
    }

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    int? h1 = 50;

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: const Text(
            " Content",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1)),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          GestureDetector(
            onTap: () {
              launchUrl(url[0]);
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 1,
                    image: AssetImage("assets/images/c1.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                //   color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Padding(
                  padding: EdgeInsets.only(top: 200, left: 80),
                  child: Text(
                    "Your Menstural Cycle ",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        height: 2,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(url[1]);
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 1,
                    image: AssetImage("assets/images/youn.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),

                // color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Text(
                    "महिनावारी रोकियो ? अरु कारण पनि हुन सक्छन् ",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        height: 2,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(url[2]);
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 1,
                    image: AssetImage("assets/images/period.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),

                // color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Text(
                    "महिनावरी सम्बन्धी केही भ्रम र वास्तविकता ",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        height: 2,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(url[1]);
            },
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 1,
                    image: AssetImage("assets/images/youn.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),

                // color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Text(
                    " ",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        height: 2,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(url[2]);
            },
            child: Card(
              elevation: 5,
              child: Container(
                color: Colors.pink[50],
                height: h * 0.3,
                width: w,
                child: const Center(
                  child: Text(
                    "Your Menstural Cycle ",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              color: Colors.pink[50],
              height: h * 0.3,
              width: w,
              child: const Center(
                child: Text(
                  "Your Menstural Cycle ",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const MyApps());
                  },
                  child: const Icon(Icons.timer)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const Calendar());
                  },
                  child: const Icon(Icons.calendar_month)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const MyHomePage(
                          title: 'hh',
                        ));
                  },
                  child: const Icon(Icons.girl_sharp)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const Stat());
                  },
                  child: const Icon(Icons.auto_graph)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => const Content());
                  },
                  child: const Icon(Icons.content_copy)),
              label: '',
              backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
        ],
      ),
    ));
  }
}
