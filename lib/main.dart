import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'date_rect.dart';
import 'week_circle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Selector Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Date Selector Demo'),
        ),
        body: const Center(
          child: DateSelector(),
        ),
      ),
    );
  }
}

class DateSelector extends StatefulWidget {
  @override
  const DateSelector({key}) : super(key: key);

  @override
  State<DateSelector> createState() => _DateSelector();
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
