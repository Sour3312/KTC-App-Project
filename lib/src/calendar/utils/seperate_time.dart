
import 'package:flutter_ktc_booking/src/calendar/model/time_item.dart';

List<TimeItem> seperateTime(DateTime dateTime, DateTime? minTime) {
  List<TimeItem> _time = [];
  for(int i =0; i < 10; i++) {
    List<DateTime> listOfDateTime = _getListOfTimes(dateTime, i);
    if(minTime != null) {
      if(listOfDateTime.last.isAfter(minTime)) {
        _time.add(TimeItem(date: dateTime.day, time: listOfDateTime));
      }
    }

  }
  return _time;
}

List<DateTime> _getListOfTimes(DateTime dateTime, int page) {
  List<DateTime> timeList = [];
  for(int i = page * 5; i <= (page * 5) + 4; i++) {
    DateTime time = DateTime(dateTime.year, dateTime.month, dateTime.day, i~/2, (i%2 == 0)? 0: 30);
    timeList.add(time);
  }
  return timeList;
}