import 'package:flutter/material.dart';
import 'package:lab11/data/app_data.dart';
import 'package:lab11/data/busline.dart';
import 'package:lab11/data/passenger.dart';
import 'package:lab11/widgets/appbar.dart';
import 'package:lab11/widgets/text_widget.dart';

class PassengerPage extends StatefulWidget {
  static const routeName = '/passenger';
  final BusLine bus;

  PassengerPage({Key key, @required this.bus}) : super(key: key);

  @override
  PassengerPageState createState() => PassengerPageState();
}

class PassengerPageState extends State<PassengerPage> {
  @override
  void initState() {
    for (int i = 0; i < widget.bus.seatNumber; i++) {
      int curSize = seatList.where((e) => e.busId == widget.bus.id).length;
      if (curSize >= widget.bus.seatNumber) break;
      // for (Passenger p in seatList){
      //   if(p.seatNumber == i){
      //     if(p.isTopSeat)
      //   }
      // }
      if (seatList.where((e) => e.seatNumber == i && e.isTopSeat) == null) {
        seatList.add(Passenger(widget.bus.id, 'Нет имени', i, true, null));
      } else if (seatList.where((e) => e.seatNumber == i && !e.isTopSeat) ==
          null) {
        seatList.add(Passenger(widget.bus.id, 'Нет имени', i, false, null));
      } else {
        seatList.add(Passenger(widget.bus.id, 'Нет имени', i, false, null));
        curSize = seatList.where((e) => e.busId == widget.bus.id).length;
        if (curSize < widget.bus.seatNumber)
          seatList.add(Passenger(widget.bus.id, 'Нет имени', i, true, null));
      }
    }
    super.initState();
  }

  Widget passengerElement(name, seatNumber, isTopSeat, isOnline) {
    String btnText = 'no type';
    if (isOnline != null) btnText = isOnline ? 'ONLINE' : 'OFFLINE';
    String seatType = isTopSeat ? 'верхний' : 'нижний';
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.center,
              child: textWidget(name, 24.0)),
          Container(
            width: MediaQuery.of(context).size.width * 0.24,
            child: Column(
              children: [
                textWidget(seatNumber.toString(), 26.0),
                textWidget(seatType, 16.0),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    backgroundColor:
                        btnText == 'OFFLINE' ? Colors.black26 : Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child:
                    textWidget(btnText, 24.0, FontWeight.w400, Colors.white70),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: appBar('Пассажиры'),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: textWidget('Имя', 24.0, FontWeight.w500)),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.19,
                      child: textWidget('Место', 24.0, FontWeight.w500)),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: textWidget('Тип', 24.0, FontWeight.w500)),
                ],
              ),
            ),
            ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: seatList
                    .where(
                        (e) => e.busId == widget.bus.id && e.isOnline != null)
                    .map((seat) => passengerElement(seat.name, seat.seatNumber,
                        seat.isTopSeat, seat.isOnline))
                    .toList()),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: textWidget('Свободные места', 24.0, FontWeight.w500)),
            ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: seatList
                    .where(
                        (e) => e.busId == widget.bus.id && e.isOnline == null)
                    .map((seat) => passengerElement(seat.name, seat.seatNumber,
                        seat.isTopSeat, seat.isOnline))
                    .toList()),
          ],
        ));
  }
}
