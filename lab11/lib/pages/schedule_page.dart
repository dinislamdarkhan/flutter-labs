import 'package:flutter/material.dart';

import 'package:lab11/data/app_data.dart';
import 'package:lab11/widgets/appbar.dart';
import 'package:lab11/widgets/bus_card.dart';
import 'package:lab11/widgets/custom_drawer.dart';

class SchedulePage extends StatefulWidget {
  bool isSchedule;

  SchedulePage({Key key, this.isSchedule = true}) : super(key: key);

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  Widget deleteDialog(bus) {
    return AlertDialog(
        content: Text("Вы хотите удалить этот рейс?",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 21.0)),
        actions: [
          dialogButton("НЕТ", false, null),
          dialogButton("ДА", true, bus)
        ]);
  }

  Widget dialogButton(text, isDelete, bus) {
    return FlatButton(
        child: Text(text,
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 18.0)),
        onPressed: () {
          if (isDelete) setState(() => busList.remove(bus));
          Navigator.of(context).pop();
        });
  }

  Widget floatingActionButton() {
    if (widget.isSchedule) {
      return FlatButton(
          onPressed: () {},
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 00, 0, 50),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 105),
              child: Text('Добавить рейс',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400))));
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
