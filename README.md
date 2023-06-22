A beautiful calendar library for cross platforms.

## Maxx Calendar

This package provides two month view modes.

![Group 4 (1)](https://user-images.githubusercontent.com/64951609/247869785-47fa9aa8-c91a-420a-bebc-b00ae5082cc8.png)



## Features

- Switch MonthView modes between events with visible texts and events with dots.
- In built buttons for switching months
- Null safe
- Border colors, text colors and events background colors can be customized easily.
- In built buttons for month switching can be hidden.
- Callbacks for month changes and event clicks.

## Getting started

Just add the widget to your widget tree and go ahead !

## Usage

```
//create Events (read the comments carefully)
List<List<MaxxEventModel>> events = [
      [
        MaxxEventModel(
            id: "unique id here if you want or the date format you want",
            title: "event 1 name",
            bgColor: Colors.cyan,
            textColor: Colors.white),
        MaxxEventModel(
            id: "unique id here if you want or the date format you want",
            title: "event 2 name",
            bgColor: Colors.cyan,
            textColor: Colors.white)
      ], //Adds this events to day 1 of the current month
      <MaxxEventModel>[].toList() //this adds empty events for day 2
      //You must add empty events for days which should not have anything
    ];

Expanded(
         child: MaxxCalendar(calType: CalType.MONTHVIEW,
                tileBorderColor: Colors.indigoAccent,
                tileDateColor: Colors.black,
                events: events, //fetch new events from your remote repo on date change
                onDateClick: (date){},
                onDateChangeListener: (date){},
                currMonth: 6, //sets the initial month
                currYear: 2023, //sets the initial year
                hideMonthNavigationButtons: false),
         )
```



