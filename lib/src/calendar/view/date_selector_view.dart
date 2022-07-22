import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/calendar/model/week_item.dart';
import 'package:flutter_ktc_booking/src/calendar/utils/compare_date.dart';
import 'package:flutter_ktc_booking/src/calendar/utils/separate_weeks.dart';
import 'package:flutter_ktc_booking/src/calendar/view/date_view.dart';

@immutable
// ignore: must_be_immutable
class DateSelectorView extends StatefulWidget {
  DateSelectorView(
      {required this.defaultDateTime,
      this.minDateTime,
      this.maxDateTime,
      this.weekInfo = const [
        DateTime.sunday,
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
        DateTime.friday,
        DateTime.saturday
      ],
      this.selectedDate,
      required this.onDateSelected,
      Key? key})
      : super(key: key);

  final DateTime defaultDateTime;
  final DateTime? minDateTime;
  final DateTime? maxDateTime;
  List<int> weekInfo;
  final DateTime? selectedDate;
  final Function(int year, int month, int day) onDateSelected;

  @override
  State<StatefulWidget> createState() {
    return _DateSelectorViewState();
  }
}

class _DateSelectorViewState extends State<DateSelectorView> {
  List<WeekItem> weekItems = [];
  late PageController _pageController;

  late DateTime defaultDayTime;
  DateTime? selectedDateTime;

  @override
  void initState() {
    super.initState();
    defaultDayTime = widget.defaultDateTime;
    weekItems = _numberOfWeeks(defaultDayTime);
    selectedDateTime = widget.selectedDate;
    _pageController =
        PageController(initialPage: _getDefaultPager(defaultDayTime));
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      allowImplicitScrolling: false,
      onPageChanged: (pageNumber) {

      },
      clipBehavior: Clip.antiAlias,
      itemBuilder: (context, page) => GridView.builder(
          shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: weekItems[page].days.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7),
          itemBuilder: (_, index) {
            return _dayOfWeekItem(
                weekItems[page].days[index], weekItems[page].month);
          }),
      controller: _pageController,
      itemCount: weekItems.length,
    );
  }

  Widget _dayOfWeekItem(DateTime? date, int month) {
    TextStyle? textStyle;
    DateTime minDateTime = widget.minDateTime == null
        ? DateTime(DateTime.now().year, DateTime.now().month - 6)
        : DateTime(widget.minDateTime!.year, widget.minDateTime!.month,
            widget.minDateTime!.day);
    DateTime? selectedDate;
    if (selectedDateTime != null) {
      selectedDate = DateTime(selectedDateTime!.year, selectedDateTime!.month,
          selectedDateTime!.day);
    }
    bool isEnable = true;
    if (date != null && date.isBefore(minDateTime)) {
      isEnable = false;
      textStyle = const TextStyle(color: Colors.grey);
    } else if (date != null &&
        selectedDate != null &&
        selectedDate.isAtSameMomentAs(date)) {
      textStyle = const TextStyle(
          color: Color(0xFF3C3567), fontWeight: FontWeight.bold);
    } else {
      textStyle = const TextStyle(color: Color(0xFF212121));
    }
    return DateView(
        month: month,
        dateTime: date,
        style: textStyle,
        minDateTime: minDateTime,
        isEnable: isEnable,
        selectedDateTime: selectedDateTime,
        onDateSelected: _onDateSelected,
    );
  }

  void _onDateSelected(int year, int month, int day) {
    widget.onDateSelected(year, month, day);
  }

  List<WeekItem> _numberOfWeeks(DateTime dateTime) {
    DateTime minDateTime = widget.minDateTime == null
        ? DateTime(DateTime.now().year, DateTime.now().month - 6)
        : DateTime(widget.minDateTime!.year, widget.minDateTime!.month,
            widget.minDateTime!.day);
    DateTime maxDateTime = widget.maxDateTime == null
        ? DateTime(DateTime.now().year, DateTime.now().month + 6)
        : DateTime(widget.maxDateTime!.year, widget.maxDateTime!.month,
            widget.maxDateTime!.day);
    return separateWeeks(dateTime, minDateTime, maxDateTime, widget.weekInfo);
  }

  @override
  void didUpdateWidget(covariant DateSelectorView oldWidget) {
    super.didUpdateWidget(oldWidget);
    defaultDayTime = widget.defaultDateTime;
    weekItems = _numberOfWeeks(defaultDayTime);
    selectedDateTime = widget.selectedDate;
    if (!compareDate(oldWidget.defaultDateTime, widget.defaultDateTime)) {
      _pageController.jumpToPage(_getDefaultPager(defaultDayTime));
    }
  }

  int _getDefaultPager(DateTime dateTime) {
    int pageNumber = 0;
    for (int i = 0; i < weekItems.length; i++) {
      bool hasDate = false;
      for (int j = 0; j < weekItems[i].days.length; j++) {
        if (weekItems[i].days[j] != null &&
            compareDate(dateTime, weekItems[i].days[j]!)) {
          hasDate = true;
          break;
        }
      }
      if (hasDate) {
        pageNumber = i;
        break;
      }
    }
    return pageNumber;
  }
}
