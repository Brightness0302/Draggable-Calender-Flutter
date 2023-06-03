import 'package:flutter/material.dart';
import 'dart:math';

class DateCircle extends StatelessWidget {
  final DateTime selectedDate;
  final int index;
  final Function(DateTime) init;
  final List<String> weekString = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  DateCircle(
      {key,
      required this.index,
      required this.selectedDate,
      required this.init})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerWidth = (MediaQuery.of(context).size.width - 64.0) / 3;

    const dateRadius = 15.0;
    const gap = 5;

    final radius = (containerWidth - dateRadius - gap - 5) / 2;
    final today = DateTime.now();
    final start = today.subtract(Duration(days: today.weekday - 1));

    final day = start.add(Duration(days: index));
    final isSelected = day.day == selectedDate.day;
    final isToday = day.day == today.day;
    return GestureDetector(
      onTap: () {
        init(day);
      },
      child: Stack(
        children: [
          Positioned(
            top: (containerWidth - dateRadius) -
                cos((index * 360 / 14 + 13) * pi / 180) * (radius * 2 - 20),
            left: -dateRadius +
                gap +
                sin((index * 360 / 14 + 13) * pi / 180) * (radius * 2 - 20),
            child: SizedBox(
              width: dateRadius * 2,
              height: dateRadius * 2,
              child: Visibility(
                visible: isToday ? false : true,
                child: Center(
                  child: Text(
                    weekString[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (containerWidth - dateRadius) -
                cos((index * 360 / 14 + 13) * pi / 180) * radius * 2,
            left: -dateRadius +
                gap +
                sin((index * 360 / 14 + 13) * pi / 180) * radius * 2,
            child: Container(
              width: dateRadius * 2,
              height: dateRadius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isToday ? Colors.red : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
