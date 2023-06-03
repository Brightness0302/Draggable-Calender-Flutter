import 'package:flutter/material.dart';
import 'dart:math';

class WeekCircle extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) init;

  WeekCircle({required this.selectedDate, required this.init});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final containerWidth = (MediaQuery.of(context).size.width - 64.0) / 3;

        const dateRadius = 20.0;
        const gap = 5;

        final radius = (containerWidth - dateRadius - gap) / 2;
        final today = DateTime.now();
        final start = today.subtract(Duration(days: today.weekday - 1));

        return Container(
          width: containerWidth,
          height: containerWidth * 2,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(209, 100, 178, 1),
                Color.fromRGBO(163, 73, 164, 1)
              ],
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(containerWidth),
              bottomRight: Radius.circular(containerWidth),
            ),
          ),
          child: Stack(
            children: List.generate(7, (index) {
              final day = start.add(Duration(days: index));
              final isSelected = day.day == selectedDate.day;
              final isToday = day.day == today.day;

              return Positioned(
                top: (containerWidth - dateRadius) -
                    cos((index * 360 / 14 + 13) * pi / 180) * radius * 2,
                left: -dateRadius +
                    gap +
                    sin((index * 360 / 14 + 13) * pi / 180) * radius * 2,
                child: GestureDetector(
                  onTap: () {
                    init(day);
                  },
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
              );
            }),
          ),
        );
      },
    );
  }
}
