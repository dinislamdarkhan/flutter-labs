import 'package:flutter/material.dart';
import 'package:lab12/pages/schedule_page.dart';
import 'package:lab12/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: SchedulePage.routeSchedule,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
