import 'package:flutter/material.dart';

class PassengerPage extends StatefulWidget {
  @override
  PassengerPageState createState() => PassengerPageState();
}

class PassengerPageState extends State<PassengerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(),
      // body: ListView(
      // children: busList
      //     .map((bus) => BusCard(
      //   bus: bus,
      //   delete: () => showDialog(
      //       context: context, child: deleteDialog(bus)),
      //   isSchedule: widget.isSchedule,
      // ))
      //     .toList()),
    );
  }
}
