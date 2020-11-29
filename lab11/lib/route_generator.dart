import 'package:flutter/material.dart';
import 'package:lab11/data/busline.dart';
import 'package:lab11/pages/passenger_page.dart';
import 'package:lab11/pages/schedule_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SchedulePage.routeSchedule:
        return MaterialPageRoute(
            builder: (context) => SchedulePage(isSchedule: true));
      case SchedulePage.routePassenger:
        return MaterialPageRoute(
            builder: (context) => SchedulePage(isSchedule: false));
      case PassengerPage.routeName:
        if (args is BusLine) {
          return MaterialPageRoute(
              builder: (context) => PassengerPage(bus: args));
        }
        break;
    }
    return null;
  }
}
