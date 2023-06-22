import 'package:flutter/material.dart';
import 'package:maxx_calendar/widget/cal_model.dart';
import 'package:maxx_calendar/widget/views.dart';


class CalendarDotTile extends StatefulWidget {
  String title;
  String date;
  List<MaxxEventModel> events = [];
  Function(Map<String, List<MaxxEventModel>>) onClick;
  bool isEnabled;
  Color tileTextColor;
  Color tileBorderColor;
  String todaysDate;

  CalendarDotTile(
      {required this.title, required this.events, required this.onClick, required this.isEnabled, required this.date, required this.todaysDate, required this.tileTextColor, required this.tileBorderColor});

  @override
  State<CalendarDotTile> createState() => _CalendarDotTileState();
}

class _CalendarDotTileState extends State<CalendarDotTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: InkWell(
        onTap: () {
          widget.onClick({widget.date: widget.events});
        },
        child: Card(
          color: Colors.white,
          elevation: 0,
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: widget.isEnabled ? widget.tileBorderColor : Colors.grey
                    .shade400, width: 0.5),
          ),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 5,
                child: SizedBox(
                  height: 30,
                  child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3.0, vertical: 2.0),
                        child: widget.todaysDate == widget.date
                            ? Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(borderRadius: BorderRadius
                              .circular(100),
                              color: Colors.indigoAccent),
                          child: Align(
                            alignment: Alignment.center,
                            child: titleText(widget.title, 12,
                                textColor: widget.isEnabled
                                    ? Colors.white
                                    : Colors.grey, textAlign: TextAlign.center),
                          ),
                        )
                            : titleText(widget.title, 12,
                            textColor:
                            widget.isEnabled ? widget.tileTextColor : Colors
                                .grey),
                      ),
                  ),
                ),
              ),
              Positioned(
                top: 27,
                child: SizedBox(
                  height: 20,
                  child: widget.events.isNotEmpty ? ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.events.length >= 4 ? 4 : widget.events
                          .length,
                      itemBuilder: (context, index) {
                        var item = widget.events[index];
                        return Container(
                          padding: const EdgeInsets.all(0),

                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.events.isEmpty ? Colors.white : item
                                  .bgColor
                          ),
                          alignment: Alignment.center,
                          height: 8,
                          width: 8,
                        );
                      })
                      : SizedBox(height: 1,),
                ),
              ),
              widget.events.length >= 4 ? Positioned(
                  top: 30, child: paragraphText(". . .", size: 15)) : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
