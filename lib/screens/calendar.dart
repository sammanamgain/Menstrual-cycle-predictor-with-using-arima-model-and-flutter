import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menstrual_period_tracker/screens/content.dart';
import 'package:menstrual_period_tracker/screens/stat.dart';
import 'package:menstrual_period_tracker/symptoms.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:flutter/material.dart' hide CalendarDatePicker;

import '../timerui.dart';
//import 'Content.dart';

String period_date = '2079-10-13T18:34:14';

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
            title: const Text("पात्रो"),
            backgroundColor: Color.fromARGB(255, 255, 188, 211),
            centerTitle: true,
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
          body: CalendarDatePickerWidget(),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {
                        Get.to(() => MyApps(widget.email));
                      },
                      child: const Icon(Icons.timer)),
                  label: '',
                  backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {
                        Get.to(() =>  Calendar(widget.email));
                      },
                      child: const Icon(Icons.calendar_month)),
                  label: '',
                  backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {
                        Get.to(() => MyHomePage(widget.email));
                      },
                      child: const Icon(Icons.girl_sharp)),
                  label: '',
                  backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {
                        Get.to(() => Stat(widget.email));
                      },
                      child: const Icon(Icons.auto_graph)),
                  label: '',
                  backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {
                        Get.to(() => Content(widget.email));
                      },
                      child: const Icon(Icons.content_copy)),
                  label: '',
                  backgroundColor: const Color.fromARGB(255, 177, 128, 144)),
            ],
          ),
        ));
  }
}

class CalendarDatePickerWidget extends StatelessWidget {
  final ValueNotifier<NepaliDateTime> _selectedDate =
      ValueNotifier(NepaliDateTime.now());

  /// Events
  final List<Event> events = [
    //enter the period days from here
    Event(date: NepaliDateTime.parse(period_date), eventTitles: ['periodday1']),
    Event(
        date: NepaliDateTime.parse(period_date).add(const Duration(days: 1)),
        eventTitles: ['period day2']),
    Event(
        date: NepaliDateTime.parse(period_date).add(const Duration(days: 2)),
        eventTitles: ['period day3']),
    Event(
        date: NepaliDateTime.parse(period_date).add(const Duration(days: 3)),
        eventTitles: ['period day4']),
    Event(
        date: NepaliDateTime.parse(period_date).add(const Duration(days: 4)),
        eventTitles: ['period day5'])
  ];
  CalendarDatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                        : NepaliUnicode.convert('${dayToBuild.day}'),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                if (events.any((event) => _dayEquals(event.date, dayToBuild)))
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 5.0, color: Colors.red)),
                      ))
              ],
            );
          },
          selectedDayDecoration: const BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.circle,
          ),
          todayDecoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: ValueListenableBuilder<NepaliDateTime>(
            valueListenable: _selectedDate,
            builder: (context, date, _) {
              Event? event;
              try {
                event = events.firstWhere((e) => _dayEquals(e.date, date));
              } on StateError {
                event = null;
              }

              if (event == null) {
                return const Center(
                  child: Text('No Period'),
                );
              }

              return ListView.separated(
                itemCount: event.eventTitles.length,
                itemBuilder: (context, index) => ListTile(
                  leading: TodayWidget(
                    today: date,
                  ),
                  title: Text(event!.eventTitles[index]),
                  onTap: () {},
                ),
                separatorBuilder: (context, _) => const Divider(),
              );
            },
          ),
        ),
      ],
    );
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
  final NepaliDateTime date;
  final List<String> eventTitles;
  Event({required this.date, required this.eventTitles});
}
