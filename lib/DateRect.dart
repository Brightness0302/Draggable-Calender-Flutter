import 'package:flutter/material.dart';

class DateRect extends StatelessWidget {
  final String seletedDateLabel;

  DateRect({required this.seletedDateLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 64.0) / 3 * 2,
      height: (MediaQuery.of(context).size.width - 64.0) / 3 * 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(255, 128, 192, 1),
            Color.fromRGBO(209, 100, 178, 1)
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            seletedDateLabel,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
