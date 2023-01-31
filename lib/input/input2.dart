import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menstrual_period_tracker/input/input3.dart';

class Days extends StatefulWidget {
  const Days({super.key});

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      //appBar: AppBar(title: const Text('Slider')),
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/loginimg.png"),
              fit: BoxFit.cover,
            )), //one third of HEIGHT of the
          ),
          SizedBox(
            width: w,
            height: h * 0.2,
          ),
          const Text(
            "तपाई को महिनावारी कति आन्तारल मा दोहोरिन्छ ? ",
            style: TextStyle(
                color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              Slider(
                value: _currentSliderValue,
                max: 40,
                divisions: 40,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              Text(
                _currentSliderValue.toString(),
                style: const TextStyle(color: Colors.pink, fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const Length());
                },
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
                      "अर्कों ",
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ), //one third of HEIGHT of the
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
