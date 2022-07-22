part of calender;

@immutable
// ignore: must_be_immutable
class CalendarView extends StatefulWidget {
  CalendarView(
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
      this.onDateSelected,
      this.selectedDateTime,
      this.onDateTimeSelected,
      Key? key})
      : super(key: key);

  final DateTime defaultDateTime;
  final DateTime? minDateTime;
  final DateTime? maxDateTime;
  final DateTime? selectedDateTime;
  List<int> weekInfo;
  final Function(DateTime dateTime)? onDateSelected;
  final Function(DateTime dateTime)? onDateTimeSelected;

  @override
  State<StatefulWidget> createState() {
    return _CalendarViewState();
  }
}

class _CalendarViewState extends State<CalendarView> {
  late String monthText;
  late DateTime defaultDayTime;

  // List<TimeItem> timeItem = [];
  DateTime? selectedDateTime;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    defaultDayTime = widget.defaultDateTime;
    setMonthText();
    // timeItem = seperateTime(defaultDayTime);
    selectedDateTime = widget.selectedDateTime;
    selectedDate = widget.selectedDateTime;
  }

  void setMonthText() {
    setState(() {
      monthText = DateFormat("MMMM yyyy").format(defaultDayTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.navigate_before),
              color: KTCColors.primaryColor,
              onPressed: _prevClick,
            ),
            Expanded(
                child: Text(
              monthText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.0),
            )),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              color: KTCColors.primaryColor,
              onPressed: _nextClick,
            )
          ],
        ),
        const SizedBox(
          height: 14.0,
        ),
        SizedBox(
            width: double.infinity,
            height: 30,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 7,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7),
                itemBuilder: (_, index) {
                  String day = "Sun";
                  switch (widget.weekInfo[index]) {
                    case DateTime.sunday:
                      day = "Sun";
                      break;
                    case DateTime.monday:
                      day = "Mon";
                      break;
                    case DateTime.tuesday:
                      day = "Tue";
                      break;
                    case DateTime.wednesday:
                      day = "Wed";
                      break;
                    case DateTime.thursday:
                      day = "Thu";
                      break;
                    case DateTime.friday:
                      day = "Fri";
                      break;
                    case DateTime.saturday:
                      day = "Sat";
                      break;
                  }
                  return Text(
                    day,
                    textAlign: TextAlign.center,
                  );
                })),
        const SizedBox(
          height: 12.0,
        ),
        SizedBox(
            width: double.infinity,
            height: 30,
            child: DateSelectorView(
              defaultDateTime: defaultDayTime,
              minDateTime: widget.minDateTime,
              maxDateTime: widget.maxDateTime,
              weekInfo: widget.weekInfo,
              selectedDate: selectedDate,
              onDateSelected: _onDateSelected,
            )),
        const SizedBox(
          height: 12.0,
        ),
        SizedBox(
          width: double.infinity,
          height: 30,
          child: TimeSelectorView(
            dateTime: selectedDate != null ? selectedDate! : defaultDayTime,
            minDateTime: widget.minDateTime,
            maxDateTime: widget.maxDateTime,
            selectedDate: selectedDate,
            selectedDateTime: selectedDateTime,
            onTimeSelected: _onTimeSelected,
          ),
        )
      ],
    );
  }

  void _onTimeSelected(int hour, int minute) {
    if (selectedDate == null) {
      return;
    }
    setState(() {
      selectedDateTime = DateTime(selectedDate!.year, selectedDate!.month,
          selectedDate!.day, hour, minute);
    });
    if (widget.onDateTimeSelected != null) {
      widget.onDateTimeSelected!(DateTime(selectedDate!.year,
          selectedDate!.month, selectedDate!.day, hour, minute));
    }
  }

  void _onDateSelected(int year, int month, int date) {
    setState(() {
      selectedDate = DateTime(year, month, date);
      selectedDateTime = null;
    });
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(DateTime(year, month, date));
    }
  }

  void _prevClick() {
    DateTime dateTime =
        DateTime(defaultDayTime.year, defaultDayTime.month - 1, 1);
    DateTime minDateTime = widget.minDateTime == null
        ? DateTime(DateTime.now().year, DateTime.now().month - 6)
        : DateTime(widget.minDateTime!.year, widget.minDateTime!.month);
    DateTime currentDateTime = DateTime(dateTime.year, dateTime.month);
    if (currentDateTime.isAfter(minDateTime) ||
        currentDateTime.isAtSameMomentAs(minDateTime)) {
      setState(() {
        defaultDayTime = dateTime;
        // timeItem = seperateTime(defaultDayTime);
      });
      setMonthText();
    }
  }

  void _nextClick() {
    DateTime dateTime =
        DateTime(defaultDayTime.year, defaultDayTime.month + 1, 1);
    DateTime maxDateTime = widget.maxDateTime == null
        ? DateTime(DateTime.now().year, DateTime.now().month + 6)
        : DateTime(widget.maxDateTime!.year, widget.maxDateTime!.month);
    DateTime currentDateTime = DateTime(dateTime.year, dateTime.month);
    if (currentDateTime.isBefore(maxDateTime) ||
        currentDateTime.isAtSameMomentAs(maxDateTime)) {
      setState(() {
        defaultDayTime = dateTime;
        // timeItem = seperateTime(defaultDayTime);
      });
      setMonthText();
    }
  }

  @override
  void didUpdateWidget(covariant CalendarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    defaultDayTime = widget.defaultDateTime;
    setMonthText();
    // timeItem = seperateTime(defaultDayTime);
    selectedDateTime = widget.selectedDateTime;
    selectedDate = widget.selectedDateTime;
  }
}
