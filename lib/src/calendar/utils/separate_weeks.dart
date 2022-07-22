import 'package:flutter_ktc_booking/src/calendar/model/week_item.dart';

/// Read from [minDate] to [maxDate] and separate weeks.
/// Return [List] contain weeks;
List<WeekItem> separateWeeks(DateTime defaultDateTime, DateTime minDate,
    DateTime maxDate, List<int> dayOfWeek) {
  /// List contain weeks
  final List<WeekItem> _weeks = [];

  for (int i = 0; i < _weeksInMonth(defaultDateTime, dayOfWeek); i++) {
    List<DateTime?> dateTimes =
        _getDaysForCurrentWeeks(defaultDateTime, dayOfWeek, i, maxDate);
    if ((dateTimes.last?.isAfter(minDate) != false ||
            dateTimes.first?.isAtSameMomentAs(minDate) != false) &&
        (dateTimes.first?.isBefore(maxDate) != false ||
            dateTimes.first?.isAtSameMomentAs(maxDate) != false)) {
      WeekItem weekItem =
          WeekItem(month: defaultDateTime.month, days: dateTimes);
      _weeks.add(weekItem);
    }
  }

  return _weeks;
}

List<DateTime?> _getDaysForCurrentWeeks(
    DateTime date, List<int> dayOfWeekInfo, int weekIndex, DateTime maxDate) {
  DateTime? midDate = _getMidDateOfWeek(date, dayOfWeekInfo, weekIndex);
  if (midDate == null) {
    return [null, null, null, null, null, null, null];
  }
  midDate = _firstDateInGrid(dayOfWeekInfo[3], midDate);
  List<DateTime?> listOfDateTime = [];

  for (int i = -3; i <= 3; i++) {
    DateTime dateTime = DateTime(midDate.year, midDate.month, midDate.day + i);
    if (dateTime.isAfter(maxDate)) {
      listOfDateTime.add(null);
    } else {
      listOfDateTime.add(dateTime);
    }
  }

  return listOfDateTime;
}

DateTime _firstDateInGrid(int weekday, DateTime dateTime) {
  if (weekday == dateTime.weekday) {
    return dateTime;
  }
  DateTime currentDateTime = dateTime;
  while (currentDateTime.weekday != weekday) {
    currentDateTime = currentDateTime.subtract(const Duration(days: 1));
  }
  return currentDateTime;
}

DateTime? _getMidDateOfWeek(
    DateTime date, List<int> dayOfWeekInfo, int weekIndex) {
  int month = date.month;
  int year = date.year;
  int dayOfWeek = dayOfWeekInfo[0];

  DateTime firstOfMonth = DateTime(year, month);
  DateTime firstOfNextMonth = DateTime(year, month + 1);
  DateTime firstDateInGrid = _firstDateInGrid(dayOfWeek, firstOfMonth);
  if (firstDateInGrid.isAfter(firstOfMonth)) {
    firstDateInGrid = firstDateInGrid.subtract(const Duration(days: 7));
  }
  DateTime weekStart = firstDateInGrid;
  DateTime? weekStop;
  int weekNumber = 0;
  DateTime? dateTime;
  do {
    weekNumber = weekNumber + 1;
    weekStop = weekStart.add(const Duration(days: 6));
    if (weekNumber == weekIndex + 1) {
      dateTime = weekStart.add(const Duration(days: 5));
      break;
    }
    weekStart = weekStop.add(const Duration(days: 1));
  } while (weekStop.isBefore(firstOfNextMonth));
  return dateTime;
}

int _weeksInMonth(DateTime defaultDateTime, List<int> dayOfWeekInfo) {
  int i = 0;
  int month = defaultDateTime.month;
  int year = defaultDateTime.year;
  int dayOfWeek = dayOfWeekInfo[0];

  DateTime firstOfMonth = DateTime(year, month);
  DateTime firstOfNextMonth = DateTime(year, month + 1);
  DateTime firstDateInGrid = _firstDateInGrid(dayOfWeek, firstOfMonth);
  if (firstDateInGrid.isAfter(firstOfMonth)) {
    firstDateInGrid = firstDateInGrid.subtract(const Duration(days: 7));
  }
  DateTime weekStart = firstDateInGrid;
  DateTime? weekStop;
  do {
    i++;
    weekStop = weekStart.add(const Duration(days: 6));

    weekStart = weekStop.add(const Duration(days: 1));
  } while (weekStart.isBefore(firstOfNextMonth));

  return i;
}
