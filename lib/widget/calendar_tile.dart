import 'package:flutter/material.dart';
import 'package:maxx_calendar/widget/cal_model.dart';
import 'package:maxx_calendar/widget/views.dart';

//ignore: must_be_immutable
class CalendarTile extends StatefulWidget {
  String title;
  List<MaxxEventModel> events = [];
  Function(Map<String, List<MaxxEventModel>>) onClick;
  bool isEnabled;
  String date;
  String todaysDate;
  Color tileTextColor;
  Color tileBorderColor;

  CalendarTile(
      {Key? key, required this.title,
      required this.events,
      required this.onClick,
      required this.isEnabled,
      required this.date,
      required this.todaysDate,
      required this.tileTextColor,
      required this.tileBorderColor}) : super(key: key);

  @override
  State<CalendarTile> createState() => _CalendarTileState();
}

class _CalendarTileState extends State<CalendarTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        splashColor: Colors.black26,
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          widget.onClick({widget.date: widget.events});
        },
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: widget.isEnabled
                    ? widget.tileBorderColor
                    : Colors.grey.shade400,
                width: 0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 3.0, vertical: 2.0),
                  child: widget.todaysDate == widget.date
                      ? Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.indigoAccent),
                          child: Align(
                            alignment: Alignment.center,
                            child: titleText(widget.title, 10,
                                textColor: widget.isEnabled
                                    ? Colors.white
                                    : Colors.grey,
                                textAlign: TextAlign.center),
                          ),
                        )
                      : titleText(widget.title, 10,
                          textColor: widget.isEnabled
                              ? widget.tileTextColor
                              : Colors.grey),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          widget.events.length >= 4 ? 4 : widget.events.length,
                      itemBuilder: (context, index) {
                        var item = widget.events[index];
                        return Card(
                          color: item.bgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 2),
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2),
                              child: paragraphText(item.title,
                                  textColor: item.textColor, size: 7),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
