
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

//Wrap in expanded if using column or listview
MaxxCalendar(calType: CalType.MONTHVIEW,
                tileBorderColor: Colors.indigoAccent,
                tileDateColor: Colors.black,
                events: events, //fetch new events from your remote repo on date change
                onDateClick: (date){},
                onDateChangeListener: (date){},
                currMonth: 6, //sets the initial month
                currYear: 2023, //sets the initial year
                hideMonthNavigationButtons: false),
```



