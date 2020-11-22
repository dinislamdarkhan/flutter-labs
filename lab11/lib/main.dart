import 'package:flutter/material.dart';
import 'package:lab11/pages/schedule_page.dart';
import 'package:lab11/pages/passenger_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/schedule',
      routes: {
        '/schedule': (context) => SchedulePage(isSchedule: true),
        '/passenger_choice': (context) => SchedulePage(isSchedule: false),
        '/passenger': (context) => PassengerPage(),
      },
    ));
