import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> sendRequest(List<double> data) async {
  String url = 'http://your-flask-api-url.com/predict';
  Map<String, String> headers = {'Content-Type': 'application/json'};
  String jsonBody = '{"data": ${jsonEncode(data)}}';
  http.Response response =
      await http.post(url as Uri, headers: headers, body: jsonBody);
  Map<String, dynamic> result = jsonDecode(response.body);
  return result;
}
