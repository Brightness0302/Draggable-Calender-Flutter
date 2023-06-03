import 'package:flutter/material.dart';
import 'dart:math';
import 'date_circle.dart';

class WeekCircle extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) init;

  const WeekCircle({key, required this.selectedDate, required this.init})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final containerWidth = (MediaQuery.of(context).size.width - 64.0) / 3;

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
              return DateCircle(
                  index: index, selectedDate: selectedDate, init: init);
            }),
          ),
        );
      },
    );
  }
}
