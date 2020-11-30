import 'package:flutter/material.dart';

import 'package:lab12/data/app_data.dart';
import 'package:lab12/widgets/appbar.dart';
import 'package:lab12/widgets/bus_card.dart';
import 'package:lab12/widgets/custom_drawer.dart';
import 'package:lab12/widgets/text_widget.dart';

class SchedulePage extends StatefulWidget {
  static const routeSchedule = '/schedule';
  static const routePassenger = '/passenger_choice';
  bool isSchedule;

  SchedulePage({Key key, this.isSchedule = true}) : super(key: key);

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  Widget deleteDialog(bus) {
    return AlertDialog(
        content: textWidget("Вы хотите удалить этот рейс?", fontSize: 21.0),
        actions: [
          dialogButton("НЕТ", false, null),
          dialogButton("ДА", true, bus)
        ]);
  }

  Widget dialogButton(text, isDelete, bus) {
    return FlatButton(
        child: textWidget(text,
            fontSize: 18.0, weight: FontWeight.w500, color: Colors.green),
        onPressed: () {
          if (isDelete) setState(() => busList.remove(bus));
          Navigator.of(context).pop();
        });
  }

  Widget floatingActionButton() {
    if (widget.isSchedule) {
      return Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.width * 0.15,
          child: ElevatedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                // backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            child: textWidget('ДОБАВИТЬ РЕЙС',
                fontSize: 22.0, weight: FontWeight.w400, color: Colors.white),
          ));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: appBar(widget.isSchedule ? 'Расписание' : 'Выберите рейс'),
        body: ListView(
            children: busList
                .map((bus) => BusCard(
                      bus: bus,
                      delete: () => showDialog(
                          context: context, child: deleteDialog(bus)),
                      isSchedule: widget.isSchedule,
                    ))
                .toList()),
        floatingActionButton: floatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: CustomDrawer());
  }
}
