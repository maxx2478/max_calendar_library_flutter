<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## Maxx Calendar
 This package provides two month view modes.

## Features
- Switch MonthView modes between events with visible texts and events with dots.
- In built buttons for switching months
- Null safe
- Border colors, text colors and events background colors can be customized easily.
- In built buttons for month switching can be hidden.
- Callbacks for month changes and event clicks.

## Getting started

Just add the widget to your widget tree and go ahead !
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

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
