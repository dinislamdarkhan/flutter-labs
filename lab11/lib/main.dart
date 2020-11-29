import 'package:flutter/material.dart';
import 'package:lab11/pages/schedule_page.dart';
import 'package:lab11/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SchedulePage.routeSchedule,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
