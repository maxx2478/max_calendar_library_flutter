A beautiful calendar library for cross platforms.

## Maxx Calendar
 This package provides two month view modes.

![Group 4 (1)](https://github.com/maxx2478/max_calendar_library_flutter/assets/64951609/47fa9aa8-c91a-420a-bebc-b00ae5082cc8)


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
MaxxCalendar(
            events: listOfEvents, //List<List<MaxxEventModel>>
            calType: CalType.MONTHVIEW,
            tileDateColor: Colors.black,
            tileBorderColor: Colors.red,
            onDateClick: (events) {
              events.forEach((key, value) {
                //key contains your current date and it's value contains all the events
              });
            },
            onDateChangeListener: (date) {
              //fetch new data for the current month
            },
            currMonth: 6,
            currYear: 2023,
            hideMonthNavigationButtons: false,
          )
```



