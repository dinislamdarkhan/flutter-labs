import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab12/data/busline.dart';
import 'package:lab12/pages/passenger_page.dart';
import 'package:lab12/widgets/text_widget.dart';

class BusCard extends StatelessWidget {
  final BusLine bus;
  final Function delete;
  final bool isSchedule;
  BusCard({Key key, @required this.bus, this.delete, @required this.isSchedule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(children: <Widget>[
            InkWell(
              onTap: () => isSchedule
                  ? null
                  : Navigator.pushNamed(context, PassengerPage.routeName,
                      arguments: bus),
              enableFeedback: !isSchedule,
              splashColor: Colors.transparent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset('assets/${bus.icon}',
                              fit: BoxFit.fitHeight, width: 150, height: 200)),
                      SizedBox(height: 5),
                      textWidget(bus.name,
                          fontSize: 20.0, weight: FontWeight.w600),
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 20, 5),
                              width: 60.0,
                              child: textWidget(bus.carNumber, fontSize: 18.0)),
                          textWidget(bus.seatNumber.toString() + ' мест',
                              fontSize: 18.0)
                        ],
                      ),
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          textWidget(bus.from + ' -', fontSize: 24.0),
                          textWidget(bus.to, fontSize: 24.0),
                          SizedBox(height: 15),
                          textWidget('Отправление',
                              fontSize: 20.0, weight: FontWeight.bold),
                          SizedBox(height: 5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget(
                                    'Дата  -  ' +
                                        DateFormat('dd.MM.yyyy E')
                                            .format(bus.fromDateTime),
                                    fontSize: 18.0),
                                SizedBox(height: 5),
                                textWidget(
                                    'Время  -  ' +
                                        DateFormat('HH:mm')
                                            .format(bus.fromDateTime),
                                    fontSize: 18.0)
                              ]),
                          SizedBox(height: 15),
                          textWidget('Прибытие',
                              fontSize: 20.0, weight: FontWeight.bold),
                          SizedBox(height: 5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                textWidget(
                                    'Дата  -  ' +
                                        DateFormat('dd.MM.yyyy E')
                                            .format(bus.toDateTime),
                                    fontSize: 18.0),
                                SizedBox(height: 5),
                                textWidget(
                                    'Время  -  ' +
                                        DateFormat('HH:mm')
                                            .format(bus.toDateTime),
                                    fontSize: 18.0)
                              ])
                        ])
                  ]),
            ),
            isSchedule
                ? OutlinedButton(
                    onPressed: delete,
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        side: BorderSide(width: 2, color: Colors.green)),
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: textWidget('Удалить рейс')))
                : Container()
          ]),
        ));
  }
}
