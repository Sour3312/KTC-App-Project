
import 'package:flutter/material.dart';

abstract class DecoratorItem {
  void decorate(DateTime dateTime, DateTime firstDayOfTheWeek, DateTime selectedDayTime, DateTime minDateTime);
}