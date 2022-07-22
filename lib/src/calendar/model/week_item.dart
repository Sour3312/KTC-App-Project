import 'dart:collection';

class WeekItem {
  final int month;
  final List<DateTime?> days;

  WeekItem({
    this.month = DateTime.january,
    this.days = const []
  });
}
