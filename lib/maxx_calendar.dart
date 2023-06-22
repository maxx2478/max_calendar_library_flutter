library maxx_calendar;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:intl/intl.dart';
import 'package:maxx_calendar/widget/cal_model.dart';
import 'package:maxx_calendar/widget/calendar_dot_tile.dart';
import 'package:maxx_calendar/widget/calendar_tile.dart';
import 'package:maxx_calendar/widget/caltype.dart';
import 'package:maxx_calendar/widget/constants.dart';
import 'package:maxx_calendar/widget/views.dart';

//ignore: must_be_immutable
class MaxxCalendar extends StatefulWidget {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('EEE');
  DateFormat defaultFormat = DateFormat("dd-MM-yyyy");
  var calType = CalType.monthView;
  Color tileBorderColor = Colors.black54;
  Color tileDateColor = Colors.black54;
  var currMonth = DateTime.now().month;
  var currYear = DateTime.now().year;
  var firstDayOfMonth = "mon";
  var firstDaySpacing = 0;
  var endDaySpacing = 0;
  var emptyEvents = <List<MaxxEventModel>>[];
  var hideMonthNavigationButtons = false;

  var events = <List<MaxxEventModel>>[];

  var resultEvents = <List<MaxxEventModel>>[];
  Function(Map<String, List<MaxxEventModel>>) onDateClick;
  Function(String) onDateChangeListener;

  MaxxCalendar(
      {Key? key,
      required this.calType,
      required this.tileBorderColor,
      required this.tileDateColor,
      required this.events,
      required this.onDateClick,
      required this.onDateChangeListener,
      required this.currMonth,
      required this.currYear,
      required this.hideMonthNavigationButtons})
      : super(key: key);

  @override
  State<MaxxCalendar> createState() => _MaxxCalendarState();
}

class _MaxxCalendarState extends State<MaxxCalendar> {

  //get total no of days in the provided month
  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[month - 1];
  }

  //creates the final events list for calendar
  void createFinalList() {
    widget.firstDayOfMonth =
        widget.formatter.format(DateTime(widget.currYear, widget.currMonth, 0));

    widget.firstDaySpacing = Constants.firstDayOffset(widget.currYear,
        (widget.currMonth), const DefaultMaterialLocalizations());

    if (widget.firstDaySpacing > 0) {
      for (var i = 1; i <= widget.firstDaySpacing; i++) {
        widget.emptyEvents.add([]);
      }
    }

    widget.resultEvents.addAll(widget.emptyEvents);

    if (widget.events.length <=
        getDaysInMonth(widget.currYear, widget.currMonth)) {
      widget.resultEvents.addAll(widget.events);
    } else {
      throw ("Events size : ${widget.events.length} - Events are more than the number of days present in current month");
    }

    var tempEndspacing = (getDaysInMonth(widget.currYear, widget.currMonth) +
        widget.firstDaySpacing);
    widget.endDaySpacing = 0;
    if ((tempEndspacing) % 7 != 0) {
      for (var i = 0; i < 10; i++) {
        widget.endDaySpacing++;
        if ((tempEndspacing + widget.endDaySpacing) % 7 == 0) {
          break;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    createFinalList();
  }

  @override
  Widget build(BuildContext context) {

    //handle next button click
    void onNextBtnClick() {
      setState(() {
        widget.resultEvents = [];
        widget.emptyEvents = [];
        if (widget.currMonth != 12) {
          widget.currMonth = widget.currMonth + 1;
        } else {
          widget.currMonth = 1;
          widget.currYear = widget.currYear + 1;
        }

        createFinalList();
      });
      widget.onDateChangeListener("${widget.currMonth}-${widget.currYear}");
    }

    //handle prev button click
    void onPrevBtnClick() {
      setState(() {
        widget.resultEvents = [];
        widget.emptyEvents = [];
        if(widget.currMonth!=1)
          {
            widget.currMonth = widget.currMonth - 1;
          }
        else
          {
            widget.currMonth = 12;
            widget.currYear = widget.currYear - 1;
          }

        createFinalList();
      });
      widget.onDateChangeListener("${widget.currMonth}-${widget.currYear}");
    }

    void invokeOnclick(Map<String, List<MaxxEventModel>> events) {
      widget.onDateClick(events);
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: widget.hideMonthNavigationButtons == true
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      radius: 15,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        onPrevBtnClick();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 15,
                        ),
                      ),
                    ),
                    paragraphText(
                        "${Constants.getCalendarMonth(widget.currMonth).toString()} ${widget.currYear}",
                        size: 12),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      onTap: () {
                        onNextBtnClick();
                      },
                    ),
                  ],
                ),
        ),
        SizedBox(
          height: 16,
          child: GridView.count(
            crossAxisCount: 7,
            children: [
              paragraphText("Mon", alignment: TextAlign.center),
              paragraphText("Tue", alignment: TextAlign.center),
              paragraphText("Wed", alignment: TextAlign.center),
              paragraphText("Thu", alignment: TextAlign.center),
              paragraphText("Fri", alignment: TextAlign.center),
              paragraphText("Sat", alignment: TextAlign.center),
              paragraphText("Sun", alignment: TextAlign.center),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: Animate(
            effects: const [FadeEffect()],
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:
                        widget.calType == CalType.monthView ? 8 / 16 : 1 / 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    mainAxisExtent:
                        widget.calType == CalType.monthView ? 84 : 64,
                    crossAxisCount: 7),
                itemCount: getDaysInMonth(widget.currYear, widget.currMonth) +
                    widget.firstDaySpacing +
                    widget.endDaySpacing,
                itemBuilder: (BuildContext ctx, index) {
                  var item = ((widget.resultEvents.length) - 1) >= index
                      ? widget.resultEvents[index]
                      : <MaxxEventModel>[];
                  return Animate(
                    effects: [FadeEffect(delay: 500.ms)],
                    child: widget.calType == CalType.monthView
                        ? CalendarTile(
                            title: ((index - widget.firstDaySpacing < 0
                                    ? "${getDaysInMonth(widget.currMonth == 1 ? (widget.currYear - 1) : (widget.currYear), (widget.currMonth - 1 < 1 ? 12 : widget.currMonth - 1)) + 1 - (widget.firstDaySpacing) + index}"
                                    : index >=
                                            (getDaysInMonth(widget.currYear,
                                                    widget.currMonth) +
                                                widget.firstDaySpacing)
                                        ? "${index + 1 - (getDaysInMonth(widget.currYear, widget.currMonth) + widget.firstDaySpacing)}"
                                        : "${(index + 1) - widget.firstDaySpacing}"))
                                .toString(),
                            events: item,
                            onClick: (events) {
                              invokeOnclick(events);
                            },
                            isEnabled: (index - widget.firstDaySpacing < 0
                                ? false
                                : index >=
                                        (getDaysInMonth(widget.currYear,
                                                widget.currMonth) +
                                            widget.firstDaySpacing)
                                    ? false
                                    : true),
                            date: (index - widget.firstDaySpacing < 0
                                ? "" //previous month dates
                                : index >=
                                        (getDaysInMonth(widget.currYear,
                                                widget.currMonth) +
                                            widget.firstDaySpacing)
                                    ? "" //next month dates
                                    : "${index - widget.firstDaySpacing + 1 < 10 ? "0${index - widget.firstDaySpacing + 1}" : index - widget.firstDaySpacing + 1}-${widget.currMonth < 10 ? "0${widget.currMonth}" : widget.currMonth}-${widget.currYear}"),
                            todaysDate:
                                widget.defaultFormat.format(DateTime.now()),
                            tileBorderColor: widget.tileBorderColor,
                            tileTextColor: widget.tileDateColor,
                          )
                        : CalendarDotTile(
                            title: ((index - widget.firstDaySpacing < 0
                                    ? "${getDaysInMonth(widget.currMonth == 1 ? (widget.currYear - 1) : (widget.currYear), (widget.currMonth - 1 < 1 ? 12 : widget.currMonth - 1)) + 1 - (widget.firstDaySpacing) + index}"
                                    : index >=
                                            (getDaysInMonth(widget.currYear,
                                                    widget.currMonth) +
                                                widget.firstDaySpacing)
                                        ? "${index + 1 - (getDaysInMonth(widget.currYear, widget.currMonth) + widget.firstDaySpacing)}"
                                        : "${(index + 1) - widget.firstDaySpacing}"))
                                .toString(),
                            events: item,
                            onClick: (events) {
                              invokeOnclick(events);
                            },
                            isEnabled: (index - widget.firstDaySpacing < 0
                                ? false
                                : index >=
                                        (getDaysInMonth(widget.currYear,
                                                widget.currMonth) +
                                            widget.firstDaySpacing)
                                    ? false
                                    : true),
                            date: (index - widget.firstDaySpacing < 0
                                ? "" //previous month dates
                                : index >=
                                        (getDaysInMonth(widget.currYear,
                                                widget.currMonth) +
                                            widget.firstDaySpacing)
                                    ? "" //next month dates
                                    : "${index - widget.firstDaySpacing + 1 < 10 ? "0${index - widget.firstDaySpacing + 1}" : index - widget.firstDaySpacing + 1}-${widget.currMonth < 10 ? "0${widget.currMonth}" : widget.currMonth}-${widget.currYear}"),
                            todaysDate:
                                widget.defaultFormat.format(DateTime.now()),
                            tileBorderColor: widget.tileBorderColor,
                            tileTextColor: widget.tileDateColor,
                          ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
