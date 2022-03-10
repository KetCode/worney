import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  late String _hour, _minute, _time, _showHour = '00 : 00';
 
  TimeOfDay selectedTimeIn = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedTimeOut = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedTimeIn2 = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedTimeOut2 = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedTimeIn3 = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedTimeOut3 = const TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _timeControllerIn = TextEditingController();
  final TextEditingController _timeControllerOut = TextEditingController();
  final TextEditingController _timeControllerIn2 = TextEditingController();
  final TextEditingController _timeControllerOut2 = TextEditingController();
  final TextEditingController _timeControllerIn3 = TextEditingController();
  final TextEditingController _timeControllerOut3 = TextEditingController();

  int sumHours(TimeOfDay start, TimeOfDay end) {
    double totalTime = (end.hour + (end.minute / 60)) - (start.hour + (start.minute / 60));
    int hours = totalTime.floor();
    int minuts = ((totalTime - totalTime.floorToDouble()) * 60).round();
    return hours * 60 + minuts;
  }

  Future<void> _selectTimeIn(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeIn
    );
    if (picked != null) {
      setState(() {
        selectedTimeIn = picked;
        _hour = selectedTimeIn.hour.toString().padLeft(2, '0');
        _minute = selectedTimeIn.minute.toString().padLeft(2, '0');
        _time = _hour + ' : ' + _minute;
        _timeControllerIn.text = _time;
      });
    }
  }
  
  Future<void> _selectTimeOut(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeOut,
      );
    if (picked != null) {
      setState(() {
        selectedTimeOut = picked;
        _hour = selectedTimeOut.hour.toString().padLeft(2, '0');
        _minute = selectedTimeOut.minute.toString().padLeft(2, '0');
        _time = _hour + ' : ' + _minute;
        _timeControllerOut.text = _time;
        
        int calcTime = sumHours(selectedTimeIn, selectedTimeOut);
        final int hour = calcTime ~/ 60;
        final int minutes = calcTime % 60; 
        _showHour = hour.toString().padLeft(2, '0') + ' : ' + minutes.toString().padLeft(2, '0');
      });
    }
  }

  Future<void> _selectTimeIn2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeIn2
    );
    if (picked != null) {
      setState(() {
        selectedTimeIn2 = picked;
        _hour = selectedTimeIn2.hour.toString().padLeft(2, '0');
        _minute = selectedTimeIn2.minute.toString().padLeft(2, '0');
        _time = _hour + ' : ' + _minute;
        _timeControllerIn2.text = _time;
      });
    }
  }
  
  Future<void> _selectTimeOut2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeOut2,
      );
    if (picked != null) {
      setState(() {
        selectedTimeOut2 = picked;
        _hour = selectedTimeOut2.hour.toString().padLeft(2, '0');
        _minute = selectedTimeOut2.minute.toString().padLeft(2, '0');
        _time = _hour + ' : ' + _minute;
        _timeControllerOut2.text = _time;
        
        int calcTime = sumHours(selectedTimeIn, selectedTimeOut) + sumHours(selectedTimeIn2, selectedTimeOut2);
        final int hour = calcTime ~/ 60;
        final int minutes = calcTime % 60; 
        _showHour = hour.toString().padLeft(2, '0') + ' : ' + minutes.toString().padLeft(2, '0');
      });
    }
  }

  Future<void> _selectTimeIn3(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeIn3
    );
    if (picked != null) {
      setState(() {
        selectedTimeIn3 = picked;
        _hour = selectedTimeIn3.hour.toString().padLeft(2, '0');
        _minute = selectedTimeIn3.minute.toString().padLeft(2, '0');
        _time = _hour + ' : ' + _minute;
        _timeControllerIn3.text = _time;
      });
    }
  }
  
  Future<void> _selectTimeOut3(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeOut3,
      );
    if (picked != null) {
      setState(() {
        selectedTimeOut3 = picked;
        _hour = selectedTimeOut3.hour.toString().padLeft(2, '0');
        _minute = selectedTimeOut3.minute.toString().padLeft(2, '0');
        _time = _hour + ' : ' + _minute;
        _timeControllerOut3.text = _time;
        
        int calcTime = sumHours(selectedTimeIn, selectedTimeOut) + sumHours(selectedTimeIn2, selectedTimeOut2)  + sumHours(selectedTimeIn3, selectedTimeOut3);
        final int hour = calcTime ~/ 60;
        final int minutes = calcTime % 60; 
        _showHour = hour.toString().padLeft(2, '0') + ' : ' + minutes.toString().padLeft(2, '0');
      });
    }
  }

  @override
  void initState() {
    _timeControllerIn.text = '00 : 00';
    _timeControllerOut.text = '00 : 00';
    _timeControllerIn2.text = '00 : 00';
    _timeControllerOut2.text = '00 : 00';
    _timeControllerIn3.text = '00 : 00';
    _timeControllerOut3.text = '00 : 00';
    _showHour = '00 : 00';
    super.initState();
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Text(
                _showHour,
                // style: Theme.of(context).textTheme.headline2,
                style: const TextStyle(
                  color: Color(0xFF585666), //Color(0xFFFF9419)
                  fontSize: 52,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Lexend',
                ), 
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6), //removed horizontal: 38 to make more responsive.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Entrada',
                          style: TextStyle(
                            color: Color(0xFF706E7A),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF585666),
                            fixedSize: const Size(147, 55),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () => _selectTimeIn(context),
                          child: Text(
                            _timeControllerIn.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),  //
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Saída',
                          style: TextStyle(
                            color: Color(0xFF706E7A),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF585666),
                            fixedSize: const Size(147, 55),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () => _selectTimeOut(context),
                          child: Text(
                            _timeControllerOut.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ), //
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 6), //removed horizontal: 38 to make more responsive.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Entrada',
                          style: TextStyle(
                            color: Color(0xFF706E7A),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF585666),
                            fixedSize: const Size(147, 55),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () => _selectTimeIn2(context),
                          child: Text(
                            _timeControllerIn2.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),  //
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Saída',
                          style: TextStyle(
                            color: Color(0xFF706E7A),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF585666),
                            fixedSize: const Size(147, 55),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () => _selectTimeOut2(context),
                          child: Text(
                            _timeControllerOut2.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ), //
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 6), //removed horizontal: 38 to make more responsive.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Entrada',
                          style: TextStyle(
                            color: Color(0xFF706E7A),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF585666),
                            fixedSize: const Size(147, 55),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () => _selectTimeIn3(context),
                          child: Text(
                            _timeControllerIn3.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),  //
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Saída',
                          style: TextStyle(
                            color: Color(0xFF706E7A),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF585666),
                            fixedSize: const Size(147, 55),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () => _selectTimeOut3(context),
                          child: Text(
                            _timeControllerOut3.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ), //
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
