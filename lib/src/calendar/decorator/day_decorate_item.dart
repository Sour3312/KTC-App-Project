import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ktc_booking/src/calendar/decorator/decorator_item.dart';

class DayDecorateItem extends DecoratorItem {
  final Color selectedDateColor;
  final Color todayDateColor;
  final Color textColor;
  final double textSize;

  DayDecorateItem(
      {required this.selectedDateColor,
      required this.todayDateColor,
      required this.textColor,
      required this.textSize});
  @override
  void decorate(DateTime dateTime, DateTime firstDayOfTheWeek, DateTime selectedDayTime, DateTime minDateTime) {
    
  }
}
