import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/calendar/model/time_item.dart';
import 'package:flutter_ktc_booking/src/calendar/utils/compare_time.dart';
import 'package:flutter_ktc_booking/src/calendar/utils/seperate_time.dart';
import 'package:flutter_ktc_booking/src/calendar/view/time_view.dart';

class TimeSelectorView extends StatefulWidget {
  const TimeSelectorView(
      {required this.dateTime,
      this.minDateTime,
      this.maxDateTime,
      this.selectedDateTime,
      this.selectedDate,
      required this.onTimeSelected,
      Key? key})
      : super(key: key);

  final DateTime dateTime;
  final DateTime? minDateTime;
  final DateTime? maxDateTime;
  final DateTime? selectedDateTime;
  final DateTime? selectedDate;
  final Function(int hour, int minute) onTimeSelected;


  @override
  State<StatefulWidget> createState() {
    return _TimeSelectorViewState();
  }
}

class _TimeSelectorViewState extends State<TimeSelectorView> {
  List<TimeItem> timeItem = [];
  late DateTime defaultDayTime;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    defaultDayTime = widget.dateTime;
    timeItem = seperateTime(defaultDayTime, widget.minDateTime);
    _pageController = PageController(initialPage: _getDefaultPager(defaultDayTime));
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      allowImplicitScrolling: false,
      onPageChanged: (pageNumber) {
        // setState(() {
        //   _pageNumber = pageNumber;
        // });
      },
      clipBehavior: Clip.antiAlias,
      itemBuilder: (context, page) => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: timeItem[page].time.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5),
          itemBuilder: (_, index) {
            return _timeItem(timeItem[page].time[index], timeItem[page].date);
          }),
      controller: _pageController,
      itemCount: timeItem.length,
    );
  }

  Widget _timeItem(DateTime? dateTime, int date) {
    TextStyle? textStyle;
    DateTime minDateTime = widget.minDateTime == null
        ? DateTime(DateTime.now().year, DateTime.now().month - 6)
        : DateTime(
            widget.minDateTime!.year,
            widget.minDateTime!.month,
            widget.minDateTime!.day,
            widget.minDateTime!.hour,
            widget.minDateTime!.hour);
    DateTime? selectedDateTime;
    if (widget.selectedDateTime != null) {
      selectedDateTime = DateTime(
          widget.selectedDateTime!.year,
          widget.selectedDateTime!.month,
          widget.selectedDateTime!.day,
          widget.selectedDateTime!.hour,
          widget.selectedDateTime!.minute);
    }
    bool isEnable = true;
    if (dateTime != null && dateTime.isBefore(minDateTime)) {
      isEnable = false;
      textStyle = const TextStyle(color: Colors.grey);
    } else if (dateTime != null &&
        selectedDateTime != null &&
        selectedDateTime.isAtSameMomentAs(dateTime)) {
      textStyle = const TextStyle(
          color: Color(0xFF3C3567), fontWeight: FontWeight.bold);
    } else {
      textStyle = const TextStyle(color: Color(0xFF212121));
    }
    if (widget.selectedDate == null) {
      isEnable = false;
    }
    return TimeView(
      day: date,
      dateTime: dateTime,
      style: textStyle,
      minDateTime: minDateTime,
      isEnable: isEnable,
      selectedDateTime: selectedDateTime,
      onTimeSelected: _onTimeSelected,
    );
  }

  void _onTimeSelected(int hour, int minute) {

    widget.onTimeSelected(hour, minute);
  }

  @override
  void didUpdateWidget(covariant TimeSelectorView oldWidget) {
    super.didUpdateWidget(oldWidget);
    defaultDayTime = widget.dateTime;
    timeItem = seperateTime(defaultDayTime, widget.minDateTime);

    if(widget.selectedDateTime == null) {
      _pageController.jumpToPage(_getDefaultPager(defaultDayTime));
    } else {
      _pageController.jumpToPage(_getDefaultPager(widget.selectedDateTime!));
    }
  }

  int _getDefaultPager(DateTime dateTime) {
    int pageNumber = 0;
    for(int i = 0; i < timeItem.length; i++) {
      bool hasDate = false;
      for(int j = 0; j < timeItem[i].time.length; j++) {
        if(timeItem[i].time[j] != null && compareTime(dateTime, timeItem[i].time[j]!)) {
          hasDate = true;
          break;
        }
      }
      if(hasDate) {
        pageNumber = i;
        break;
      }
    }
    return pageNumber;
  }
}
