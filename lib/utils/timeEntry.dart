import 'package:flutter/material.dart';

class TimeEntry extends StatelessWidget {
  final String entryText;
  final String exitText;
  final VoidCallback onEntryPressed;
  final VoidCallback onExitPressed;

  const TimeEntry({
    Key? key,
    required this.entryText,
    required this.exitText,
    required this.onEntryPressed,
    required this.onExitPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  onPressed: () => onEntryPressed,
                  child: Text(
                    entryText,
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
            margin: const EdgeInsets.only(left: 12),
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
                  onPressed: () => onExitPressed,
                  child: Text(
                    exitText,
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
    );
  }
}
