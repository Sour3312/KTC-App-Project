import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeView extends StatelessWidget {
  const TimeView(
      {this.dateTime,
      required this.day,
      this.style,
      this.isEnable = true,
      required this.onTimeSelected,
      required this.minDateTime,
      this.selectedDateTime,
      Key? key})
      : super(key: key);

  final DateTime? dateTime;
  final int day;
  final TextStyle? style;
  final DateTime minDateTime;
  final DateTime? selectedDateTime;
  final bool isEnable;
  final Function(int hour, int minute) onTimeSelected;

  @override
  Widget build(BuildContext context) {
    if (dateTime != null && dateTime!.day == day) {
      return GestureDetector(
        onTap: () {
          if(isEnable) {
            onTimeSelected(dateTime!.hour, dateTime!.minute);
          }
        },
        child: Text(
          DateFormat("HH:mm").format(dateTime!),
          style: style,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Container();
  }
}
