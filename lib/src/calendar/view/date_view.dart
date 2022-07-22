import 'package:flutter/material.dart';

class DateView extends StatelessWidget {
  const DateView(
      {this.dateTime,
      required this.month,
      this.style,
      this.isEnable = true,
      required this.onDateSelected,
      required this.minDateTime,
      this.selectedDateTime,
      Key? key})
      : super(key: key);

  final DateTime? dateTime;
  final int month;
  final TextStyle? style;
  final DateTime minDateTime;
  final DateTime? selectedDateTime;
  final bool isEnable;
  final Function(int year, int month, int day) onDateSelected;

  @override
  Widget build(BuildContext context) {
    if (dateTime != null && dateTime!.month == month) {
      return SizedBox(
          height: 20,
          child: GestureDetector(
            onTap: () {
              if (isEnable) {
                onDateSelected(dateTime!.year, dateTime!.month, dateTime!.day);
              }
            },
            child: Text(
              "${dateTime!.day < 10 ? '0${dateTime!.day}' : dateTime!.day}",
              style: style,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ));
    }
    return Container(
      height: 20,
    );
  }
}
