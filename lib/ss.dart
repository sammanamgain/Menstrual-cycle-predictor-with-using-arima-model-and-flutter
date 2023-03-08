import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ArimaForecastPage extends StatefulWidget {
  final String? email;
  ArimaForecastPage(this.email);
  @override
  _ArimaForecastPageState createState() => _ArimaForecastPageState();
}

class _ArimaForecastPageState extends State<ArimaForecastPage> {
  final _url = 'http://10.0.2.2:5000/forecast';
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Make Forecast'),
              onPressed: _makeForecast,
            ),
          ),
          Text(result.toString())
        ],
      ),
    );
  }

  void _makeForecast() async {
    // Define the input data as a list of dictionaries
    var inputData = [
      {"date": "43", "value": 26},
      {"date": "44", "value": 27},
      {"date": "45", "value": 28}
    ];

    // Send a POST request to the Flask API
    var response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'data': inputData}),
    );
    print("response line done");
    // Parse the response as a JSON string
    var responseData = json.decode(response.body);
    print("another");
    print(responseData);
    var predictedCycleLength = responseData['predicted_Cyclelength'];
    print(predictedCycleLength);
    result = predictedCycleLength;
    print(result);

    // Print the response to the console
    //print(responseData);
    // print(responseData.predicted_cyclelength);
  }
}
