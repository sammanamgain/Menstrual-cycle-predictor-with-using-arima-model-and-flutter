// import 'dart:html';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menstrual_period_tracker/data/database.dart';
import 'package:menstrual_period_tracker/screens/content.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:menstrual_period_tracker/symptoms.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:flutter/material.dart' hide CalendarDatePicker;

import '../timerui.dart';
//import 'Content.dart';
import 'package:menstrual_period_tracker/input/input1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// String period_date = '2079-11-13T18:34:14';

//Calendar
class Calendar extends StatefulWidget {
  final String? email;
  Calendar(this.email);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "पात्रो",
              style: GoogleFonts.getFont(
                'Khand',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 253, 250, 250),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 66, 13, 106),
            toolbarHeight: 80,
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Text(
                  NepaliUtils().language == Language.english ? 'ने' : 'En',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  NepaliUtils().language =
                      NepaliUtils().language == Language.english
                          ? Language.nepali
                          : Language.english;
                  setState(() {});
                },
              ),
            ],
          ),
          body: CalendarDatePickerWidget(widget.email),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
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
                backgroundColor: Color.fromARGB(255, 245, 243, 247),
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
        ));
  }
}

class CalendarDatePickerWidget extends StatelessWidget {
  final ValueNotifier<NepaliDateTime> _selectedDate =
      ValueNotifier(NepaliDateTime.now());
  final String? email;
  CalendarDatePickerWidget(this.email);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: retrievePeriodDates(email),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            List<String> periodDates = snapshot.data!;

            return FutureBuilder<String>(
                future: retrievePeriodLength(email),
                builder: (context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    double periodlength1 = double.parse(snapshot.data!);
                    int periodlength = periodlength1.toInt();
                    List<NepaliDateTime> day =
                        getUpdatedDates(periodDates, periodlength);
                    final List<Event> events = getevents(day);
                    return Column(
                      children: [
                        CalendarDatePicker(
                          initialDate: NepaliDateTime.now(),
                          firstDate: NepaliDateTime(2078),
                          lastDate: NepaliDateTime(2090),
                          onDateChanged: (date) => _selectedDate.value = date,
                          dayBuilder: (dayToBuild) {
                            return Stack(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    NepaliUtils().language == Language.english
                                        ? '${dayToBuild.day}'
                                        : NepaliUnicode.convert(
                                            '${dayToBuild.day}'),
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                                if (events.any((event) =>
                                    _dayEquals(event.date, dayToBuild)))
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 5.0, color: Colors.red)),
                                      ))
                              ],
                            );
                          },
                          selectedDayDecoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.orange]),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: ValueListenableBuilder<NepaliDateTime>(
                            valueListenable: _selectedDate,
                            builder: (context, date, _) {
                              Event? event;
                              try {
                                event = events.firstWhere(
                                    (e) => _dayEquals(e.date, date));
                              } on StateError {
                                event = null;
                              }

                              if (event == null) {
                                return const Center(
                                  child: Text('No Period'),
                                );
                              } else {
                                return const Center(
                                  child: Text('Period'),
                                );
                              }
                              // return Text("");
                              // return ListView.separated(
                              //   itemCount: event.eventTitles.length,
                              //   itemBuilder: (context, index) => ListTile(
                              //     leading: CircleAvatar(
                              //       backgroundColor: Colors.red,
                              //     ),
                              //     title: Text(event!.eventTitles[index]),
                              //     onTap: () {},
                              //   ),
                              //   separatorBuilder: (context, _) => const Divider(),
                              // );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    // an error occurred, display an error message
                    return Text('Error: ${snapshot.error}');
                  }
                });
          } else {
            // an error occurred, display an error message
            return Text('Error: ${snapshot.error}');
          }
        });
  }

  bool _dayEquals(NepaliDateTime? a, NepaliDateTime? b) =>
      a != null &&
      b != null &&
      a.toIso8601String().substring(0, 10) ==
          b.toIso8601String().substring(0, 10);
}

class TodayWidget extends StatelessWidget {
  final NepaliDateTime today;

  const TodayWidget({
    Key? key,
    required this.today,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Event {
  late NepaliDateTime date;
  // final List<String> eventTitles;

  Event({required this.date});
}

List<NepaliDateTime> getUpdatedDates(List<String> dates, int period_length) {
  List<NepaliDateTime> updatedDates = [];
  for (var date in dates) {
    final NepaliDateTime parsedDate = NepaliDateTime.parse(date);
    updatedDates.add(parsedDate);
    for (var i = 0; i < period_length; i++) {
      final NepaliDateTime updatedDate1 = parsedDate.add(Duration(days: i));
      updatedDates.add(updatedDate1);
    }
  }
  return updatedDates;
}

List<Event> getevents(List<NepaliDateTime> day) {
  final List<Event> events = day.map((i) {
    return Event(
      date: i,
      // eventTitles: ['period day'],
    );
  }).toList();
  return events;
}

Future<List<String>> retrievePeriodDates(String? email) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final DocumentReference<Map<String, dynamic>> documentReference =
      _db.collection('User Details').doc(email);
  final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await documentReference.get();

  final Map<String, String> periodDate = {};
  if (snapshot.exists) {
    final Map<String, dynamic> data = snapshot.data()!;
    final Map<String, dynamic> periodDateData = data['Period Date'];
    periodDateData.forEach((key, value) {
      periodDate[key] = value as String;
    });
//
    List<String> dates = periodDate.values.toList();
    // print(dates);
    return dates;
  }
  List<String> a = ['a', 'b'];
  return a;
}

Future<String> retrievePeriodLength(String? email) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final DocumentReference<Map<String, dynamic>> documentReference =
      _db.collection('User Details').doc(email);
  final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await documentReference.get();

  if (snapshot.exists) {
    final Map<String, dynamic> data = snapshot.data()!;
    final String name = data['Period Length'] as String;
    //print('User name is: $name');
    return name;
  } else {
    //print('User not found');
  }
  return '';
}
//
//     return name;
//   }
//   List<String> a = ['a', 'b'];
//   return a;
// }

