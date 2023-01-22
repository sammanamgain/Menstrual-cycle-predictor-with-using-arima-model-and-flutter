import 'package:flutter/material.dart';

class Days extends StatefulWidget {
  const Days({super.key});

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Column(
        children: [
          const Text(
            "तपाई को महिनावारी कति आन्तारल मा दोहोरिन्छ ? ",
            style: TextStyle(
                color: Colors.pink, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
