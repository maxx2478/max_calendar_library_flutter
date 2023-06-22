import 'package:flutter/material.dart';

class Constants {
  static String? getCalendarMonth(int month) {

    switch (month) {
      case 1:
        {
          return "January";
        }
      case 2:
        {
          return "February";
        }
      case 3:
        {
          return "March";
        }
      case 4:
        {
          return "April";
        }
      case 5:
        {
          return "May";
        }
      case 6:
        {
          return "June";
        }
      case 7:
        {
          return "July";
        }
      case 8:
        {
          return "August";
        }
      case 9:
        {
          return "September";
        }
      case 10:
        {
          return "October";
        }
      case 11:
        {
          return "November";
        }
      case 12:
        {
          return "December";
        }
    }
    return null;
  }



  static int firstDayOffset(int year, int month, MaterialLocalizations localizations) {
    // 0-based day of week for the month and year, with 0 representing Monday.
    final int weekdayFromMonday = DateTime(year, month).weekday - 2 ;

    // 0-based start of week depending on the locale, with 0 representing Sunday.
    int firstDayOfWeekIndex = localizations.firstDayOfWeekIndex;

    // firstDayOfWeekIndex recomputed to be Monday-based, in order to compare with
    // weekdayFromMonday.
    firstDayOfWeekIndex = (firstDayOfWeekIndex - 1) % 7;

    // Number of days between the first day of week appearing on the calendar,
    // and the day corresponding to the first of the month.
    return (weekdayFromMonday - firstDayOfWeekIndex) % 7;
  }

  static int? getSpacingForFirstDayOfMonth(String day) {


    switch (day.toLowerCase()) {
      case "mon":
        {
          return 0;
        }
      case "tue":
        {
          return 1;
        }
      case "wed":
        {
          return 2;
        }
      case "thu":
        {
          return 3;
        }
      case "fri":
        {
          return 4;
        }
      case "sat":
        {
          return 5;
        }
      case "sun":
        {
          return 6;
        }
    }
    return null;
  }
}
