import 'package:flutter/material.dart';

class Length extends StatefulWidget {
  const Length({super.key});

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Column(
        children: [
          const Text(
            "तपाई को महिनावारी को आबधि कति लामो हुन्छ ? ",
            style: TextStyle(
                color: Colors.pink, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: _currentSliderValue,
            max: 10,
            divisions: 1,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
