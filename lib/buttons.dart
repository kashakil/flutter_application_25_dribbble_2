import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  TimeOfDay? _time = TimeOfDay(hour: 12, minute: 12);

  TimeOfDay? _time2 = TimeOfDay(hour: 10, minute: 10);

  DateTime? _dateTime = DateTime(2023);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: _dateTime!,
                firstDate: DateTime(1800),
                lastDate: DateTime(3000),
              );
              if (newDate != null) {
                setState(() {
                  _dateTime = newDate;
                });
              }
            },
            child: Text(
                '${_dateTime!.day} - ${_dateTime!.month} - ${_dateTime!.year}'),
          ),
          SizedBox(
            width: 6,
          ),
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? newTime =
                  await showTimePicker(context: context, initialTime: _time!);
              if (newTime != null) {
                setState(() {
                  _time = newTime;
                });
              }
            },
            child: Text(
              '${_time!.hour.toString()}:${_time!.minute.toString()}',
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            '-',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 6,
          ),
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? newTime =
                  await showTimePicker(context: context, initialTime: _time2!);
              if (newTime != null) {
                setState(() {
                  _time2 = newTime;
                });
              }
            },
            child: Text(
              '${_time2!.hour.toString()}:${_time2!.minute.toString()}',
            ),
          ),
        ],
      ),
    );
  }
}
