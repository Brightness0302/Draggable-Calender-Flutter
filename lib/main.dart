import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DateRect.dart';
import 'WeekCircle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Selector Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Date Selector Demo'),
        ),
        body: Center(
          child: DateSelector(),
        ),
      ),
    );
  }
}

class DateSelector extends StatefulWidget {
  @override
  _DateSelector createState() => _DateSelector();
}

class _DateSelector extends State<DateSelector> {
  DateTime selectedDate = DateTime.now();
  String formattedDate = "";
  String seletedDateLabel = "";

  _DateSelector() {
    selectedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    seletedDateLabel = 'Selected Date is $formattedDate';
  }

  init(DateTime t) {
    setState(() {
      selectedDate = t;
      formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      seletedDateLabel = 'Selected Date is $formattedDate';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(32.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DateRect(seletedDateLabel: seletedDateLabel),
            WeekCircle(selectedDate: selectedDate, init: init)
          ],
        ),
      ),
    );
  }
}
