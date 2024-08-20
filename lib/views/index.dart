import 'package:flutter/material.dart';
import '../utils/timeEntry.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _showHour;

  List<TimeOfDay> selectedTimesIn = [];
  List<TimeOfDay> selectedTimesOut = [];
  List<TextEditingController> timeControllersIn = [];
  List<TextEditingController> timeControllersOut = [];

  int sumHours(TimeOfDay start, TimeOfDay end) {
    int startMinutes = start.hour * 60 + start.minute;
    int endMinutes = end.hour * 60 + end.minute;
    int difference = endMinutes - startMinutes;

    if (difference < 0) {
      return 0;
    }
    return difference;
  }

  String convertTimeToString(int hour, int minute) {
    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');
    return '$formattedHour : $formattedMinute';
  }

  String showHour(int time) {
    int hour = time ~/ 60;
    int minutes = time % 60;
    return _showHour =
        '${hour.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')}';
  }

  bool isTimeOutValid(TimeOfDay start, TimeOfDay end) {
    return (end.hour > start.hour) ||
        (end.hour == start.hour && end.minute > start.minute);
  }

  @override
  void initState() {
    int numberOfPairs = 2; // número inicial de pares
    for (int i = 0; i < numberOfPairs; i++) {
      selectedTimesIn.add(TimeOfDay(hour: 0, minute: 0));
      selectedTimesOut.add(TimeOfDay(hour: 0, minute: 0));
      timeControllersIn.add(TextEditingController(text: '00 : 00'));
      timeControllersOut.add(TextEditingController(text: '00 : 00'));
    }
    _showHour = '00 : 00';
    super.initState();
  }

  Future<void> _selectTime(
      BuildContext context, int index, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? selectedTimesIn[index] : selectedTimesOut[index],
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          selectedTimesIn[index] = picked;
          timeControllersIn[index].text =
              convertTimeToString(picked.hour, picked.minute);
        } else {
          if (index < selectedTimesIn.length - 1) {
            if (isTimeOutValid(selectedTimesIn[index], picked)) {
              selectedTimesOut[index] = picked;
              timeControllersOut[index].text =
                  convertTimeToString(picked.hour, picked.minute);
              if (index + 1 < selectedTimesIn.length &&
                      selectedTimesIn[index + 1].hour < picked.hour ||
                  (selectedTimesIn[index + 1].hour == picked.hour &&
                      selectedTimesIn[index + 1].minute < picked.minute)) {
                selectedTimesIn[index + 1] = picked;
                timeControllersIn[index + 1].text =
                    convertTimeToString(picked.hour, picked.minute);
              }
            }
          } else {
            selectedTimesOut[index] = picked;
            timeControllersOut[index].text =
                convertTimeToString(picked.hour, picked.minute);
          }
        }
        _updateTotalTime();
      });
    }
  }

  void _addTimePair() {
    setState(() {
      selectedTimesIn.add(TimeOfDay(hour: 0, minute: 0));
      selectedTimesOut.add(TimeOfDay(hour: 0, minute: 0));
      timeControllersIn.add(TextEditingController(text: '00 : 00'));
      timeControllersOut.add(TextEditingController(text: '00 : 00'));
    });
  }

  void _removeTimePair(int index) {
    setState(() {
      if (index >= 0 && index < selectedTimesIn.length) {
        selectedTimesIn.removeAt(index);
        selectedTimesOut.removeAt(index);
        timeControllersIn[index].dispose();
        timeControllersOut[index].dispose();
        timeControllersIn.removeAt(index);
        timeControllersOut.removeAt(index);
        _updateTotalTime();
      }
    });
  }

  void _updateTotalTime() {
    int calcTime = 0;
    for (int i = 0; i < selectedTimesIn.length; i++) {
      calcTime += sumHours(selectedTimesIn[i], selectedTimesOut[i]);
    }
    _showHour = showHour(calcTime);
  }

  @override
  Widget build(BuildContext context) {
    /* double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(width); */

    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    _showHour,
                    // style: Theme.of(context).textTheme.headline2,
                    style: const TextStyle(
                      color: Color(0xFF585666), //Color(0xFFFF9419)
                      fontSize: 64,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Lexend',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_time),
                  iconSize: 38,
                  color: const Color(0xFF347F9B),
                  onPressed: _addTimePair,
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: selectedTimesIn.length,
                itemBuilder: (context, index) => TimeEntry(
                  entryText: timeControllersIn[index].text,
                  exitText: timeControllersOut[index].text,
                  onEntryPressed: () => _selectTime(context, index, true),
                  onExitPressed: () => _selectTime(context, index, false),
                  onRemovePressed: () => _removeTimePair(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
