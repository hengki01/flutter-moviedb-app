import 'dart:async';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final Function setDate;
  DatePicker({Key key, @required this.setDate}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context, String cond) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
    if (picked != null && picked != startDate)
      setState(() {
        if(cond == 'start') {
          startDate = picked;
        } else if (cond == 'end') {
          endDate = picked;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Start from :  "),
        RaisedButton(
          onPressed: () => _selectDate(context, 'start'),
          child: Text("${startDate.toLocal()}".split(' ')[0]),
        ),
        Text(" To : "),
        RaisedButton(
          onPressed: () => _selectDate(context, 'end'),
          child: Text("${endDate.toLocal()}".split(' ')[0]),
        ),
      ],
    );
  }
}