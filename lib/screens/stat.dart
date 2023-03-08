import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../symptoms.dart';
import '../timerui.dart';
import 'calendar.dart';
import 'content.dart';

class Stat extends StatefulWidget {
  final String? email;
  Stat(this.email);

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "सांख्यिकी",
            style: GoogleFonts.getFont(
              'Khand',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 253, 250, 250),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 66, 13, 106),
          toolbarHeight: 80,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: [
          Container(
            width: 300,
            height: 200,
            child: CycleLengthChart(data: data),
          ),
          Column(
            children: [
              Card(
                elevation: 2,
                child: SizedBox(
                  height: h * 0.1,
                  width: w,
                  child: Center(
                      child: Text(
                    "तपाइको तथ्याङ्क",
                    style: GoogleFonts.getFont(
                      'Khand',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 5, 5),
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: h * 0.1,
                width: w,
                child: Center(
                    child: Text(
                  "तपाइको औसत महिनावारी  चक्र",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                )),
              ),
              Stack(children: [
                Center(
                  child: SizedBox(
                      height: h * 0.2,
                      width: w * 0.4,
                      child: const CircularProgressIndicator(
                        value: 1,
                        color: Colors.red,
                        backgroundColor: Colors.green,
                        strokeWidth: 10,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        " 24",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "दिनहरू",
                        style: GoogleFonts.getFont(
                          'Khand',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 5, 5),
                        ),
                      ),
                    ],
                  )),
                ),
              ]),
              SizedBox(
                height: h * 0.07,
                width: w,
              ),
              SizedBox(
                height: h * 0.07,
                width: w,
                child: Center(
                    child: Text(
                  "तपाइको औसत महिनावारी  अवधि",
                  style: GoogleFonts.getFont(
                    'Khand',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                )),
              ),
              Stack(children: [
                Center(
                  child: SizedBox(
                      height: h * 0.2,
                      width: w * 0.4,
                      child: const CircularProgressIndicator(
                        value: 0.2,
                        color: Colors.red,
                        backgroundColor: Colors.green,
                        strokeWidth: 10,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Center(
                      child: Column(
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        " 4",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " दिनहरू",
                        style: GoogleFonts.getFont(
                          'Khand',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 5, 5),
                        ),
                      ),
                    ],
                  )),
                ),
              ])
            ],
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
          backgroundColor:
              Color.fromARGB(255, 66, 13, 106), // set background color
          type: BottomNavigationBarType.fixed, // set type to fixed
          selectedItemColor: Colors.white, // set selected item color
          unselectedItemColor: Colors.grey[400], // set unselected item color
          iconSize: 30, // set icon sizeincrease the size of the icons
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Get.to(() => MyApps(widget.email));
                },
                child: const Icon(Icons.timer),
              ),
              label: '',
              backgroundColor: const Color.fromARGB(255, 66, 13, 106),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Get.to(() => Calendar(widget.email));
                },
                child: const Icon(Icons.calendar_month),
              ),
              label: '',
              backgroundColor: const Color.fromARGB(255, 66, 13, 106),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Get.to(() => MyHomePage(widget.email));
                },
                child: const Icon(Icons.girl_sharp),
              ),
              label: '',
              backgroundColor: const Color.fromARGB(255, 66, 13, 106),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Get.to(() => Stat(widget.email));
                },
                child: const Icon(Icons.auto_graph),
              ),
              label: '',
              backgroundColor: const Color.fromARGB(255, 66, 13, 106),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Get.to(() => Content(widget.email));
                },
                child: const Icon(Icons.content_copy),
              ),
              label: '',
              backgroundColor: const Color.fromARGB(255, 66, 13, 106),
            ),
          ],
        ),
      ),
    );
  }
}

// class CycleLengthChart extends StatelessWidget {
//   final List<CycleData> data;
//
//   CycleLengthChart({required this.data});
//
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<CycleData, int>> seriesList = [
//       charts.Series<CycleData, int>(
//         id: 'Cycle Length',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (CycleData data, _) => data.cycleNumber,
//         measureFn: (CycleData data, _) => data.cycleLength,
//         data: this.data,
//       )
//     ];
//
//     return charts.LineChart(
//       seriesList,
//       animate: false,
//       animationDuration: Duration(milliseconds: 500),
//       defaultRenderer: charts.LineRendererConfig(
//         includePoints: true, // Render points along with lines
//       ),
//       primaryMeasureAxis: charts.NumericAxisSpec(
//         viewport: charts.NumericExtents(20, 35),
//         tickProviderSpec:
//         const charts.BasicNumericTickProviderSpec(desiredTickCount: 1),
//         renderSpec: charts.GridlineRendererSpec(
//           labelStyle: charts.TextStyleSpec(
//             fontSize: 14,
//             color: charts.MaterialPalette.gray.shade400,
//           ),
//           lineStyle: charts.LineStyleSpec(
//             thickness: 0,
//             color: charts.MaterialPalette.gray.shade200,
//           ),
//         ),
//       ),
//       behaviors: [
//          charts.LinePointHighlighter(
//           symbolRenderer: charts.CircleSymbolRenderer(),
//         ),
//         charts.ChartTitle(
//           'Cycle Length',
//           behaviorPosition: charts.BehaviorPosition.start,
//           titleOutsideJustification: charts.OutsideJustification.middle,
//         ),
//         charts.ChartTitle(
//           'Cycle Number',
//           behaviorPosition: charts.BehaviorPosition.bottom,
//           titleOutsideJustification: charts.OutsideJustification.middle,
//         ),
//
//        ],
//       selectionModels: [
//         charts.SelectionModelConfig(
//           type: charts.SelectionModelType.info,
//           changedListener: (model) {}, // Do nothing when selection changes
//         )
//       ],
//     );
//   }
// }
// class CycleLengthChart extends StatelessWidget {
//   final List<CycleData> data;
//
//   CycleLengthChart({required this.data});
//
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<CycleData, int>> seriesList = [      charts.Series<CycleData, int>(        id: 'Cycle Length',        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,        domainFn: (CycleData data, _) => data.cycleNumber,        measureFn: (CycleData data, _) => data.cycleLength,        data: this.data,      )    ];
//
//     return charts.LineChart(
//       seriesList,
//       animate: false,
//       animationDuration: Duration(milliseconds: 500),
//       defaultRenderer: charts.LineRendererConfig(
//         includePoints: true,
//         curveSmoothness: 0.2,
//         // Render points along with lines
//       ),
//       primaryMeasureAxis: charts.NumericAxisSpec(
//         viewport: charts.NumericExtents(20, 35),
//         tickProviderSpec:
//         const charts.BasicNumericTickProviderSpec(desiredTickCount: 1),
//         renderSpec: charts.GridlineRendererSpec(
//           labelStyle: charts.TextStyleSpec(
//             fontSize: 14,
//             color: charts.MaterialPalette.gray.shade400,
//           ),
//           lineStyle: charts.LineStyleSpec(
//             thickness: 0,
//             color: charts.MaterialPalette.gray.shade200,
//           ),
//         ),
//       ),
//       behaviors: [
//         charts.LinePointHighlighter(
//           symbolRenderer: charts.CircleSymbolRenderer(),
//         ),
//         charts.ChartTitle(
//           'Cycle Length',
//           behaviorPosition: charts.BehaviorPosition.start,
//           titleOutsideJustification: charts.OutsideJustification.middle,
//         ),
//         charts.ChartTitle(
//           'Cycle Number',
//           behaviorPosition: charts.BehaviorPosition.bottom,
//           titleOutsideJustification: charts.OutsideJustification.middle,
//         ),
//         charts.SeriesLegend(
//           position: charts.BehaviorPosition.top,
//           showMeasures: true,
//           measureFormatter: (num? value) => value.toString(),
//         ),
//       ],
//       selectionModels: [
//         charts.SelectionModelConfig(
//           type: charts.SelectionModelType.info,
//           changedListener: (model) {}, // Do nothing when selection changes
//         )
//       ],
//     );
//   }
// }
class CycleLengthChart extends StatelessWidget {
  final List<CycleData> data;

  CycleLengthChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<CycleData, int>> seriesList = [
      charts.Series<CycleData, int>(
        id: 'Cycle Length',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (CycleData data, _) => data.cycleNumber,
        measureFn: (CycleData data, _) => data.cycleLength,
        data: this.data,
      )
    ];

    return charts.LineChart(
      seriesList,
      animate: false,
      animationDuration: Duration(milliseconds: 500),
      defaultRenderer: charts.LineRendererConfig(
        includePoints: true, // Render points along with lines
        includeArea: true, // Fill the area under the line
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        viewport: charts.NumericExtents(20, 35),
        tickProviderSpec:
            const charts.BasicNumericTickProviderSpec(desiredTickCount: 1),
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 14,
            color: charts.MaterialPalette.gray.shade400,
          ),
          lineStyle: charts.LineStyleSpec(
            thickness: 0,
            color: charts.MaterialPalette.gray.shade200,
          ),
        ),
      ),
      domainAxis: charts.NumericAxisSpec(
        tickProviderSpec:
            charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 14,
            color: charts.MaterialPalette.gray.shade400,
          ),
          lineStyle: charts.LineStyleSpec(
            thickness: 0,
            color: charts.MaterialPalette.gray.shade200,
          ),
        ),
      ),
      behaviors: [
        charts.ChartTitle(
          'Cycle Length',
          behaviorPosition: charts.BehaviorPosition.start,
          titleOutsideJustification: charts.OutsideJustification.middle,
        ),
        charts.ChartTitle(
          'Cycle Number',
          behaviorPosition: charts.BehaviorPosition.bottom,
          titleOutsideJustification: charts.OutsideJustification.middle,
        ),
      ],
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: (model) {}, // Do nothing when selection changes
        )
      ],
    );
  }
}

class CycleData {
  final int cycleNumber;
  final int cycleLength;

  CycleData({required this.cycleNumber, required this.cycleLength});
}

List<CycleData> data = [
  CycleData(cycleNumber: 1, cycleLength: 28),
  CycleData(cycleNumber: 2, cycleLength: 26),
  CycleData(cycleNumber: 3, cycleLength: 30),
  CycleData(cycleNumber: 4, cycleLength: 29),
  CycleData(cycleNumber: 5, cycleLength: 27),
];

// CycleLengthChart(data: data);
