import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab12/data/app_data.dart';
import 'package:lab12/data/busline.dart';
import 'package:lab12/data/ticket.dart';
import 'package:lab12/widgets/appbar.dart';
import 'package:lab12/widgets/text_widget.dart';

class PassengerPage extends StatefulWidget {
  static const routeName = '/passenger';
  final BusLine bus;

  PassengerPage({Key key, @required this.bus}) : super(key: key);

  @override
  PassengerPageState createState() => PassengerPageState();
}

class PassengerPageState extends State<PassengerPage> {
  Widget cancelDialog(seat) {
    return AlertDialog(
        content:
            textWidget("Вы хотите отменить покупку билета?", fontSize: 21.0),
        actions: [
          dialogButton("НЕТ", false, null),
          dialogButton("ДА", true, seat)
        ]);
  }

  Widget dialogButton(text, isDelete, seat) {
    return FlatButton(
        child: textWidget(text,
            fontSize: 18.0, weight: FontWeight.w500, color: Colors.green),
        onPressed: () {
          if (isDelete) setState(() => seatList.remove(seat));
          checkTickets();
          seatList.sort((a, b) => a.seatNumber.compareTo(b.seatNumber));
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
  }

  void checkTickets() {
    bool isTopFree;
    bool isBottomFree;
    for (int i = 0; i < widget.bus.seatNumber / 2; i++) {
      isTopFree = true;
      isBottomFree = true;
      seatList.forEach((e) {
        if (e.seatNumber == i)
          e.isTopSeat ? isTopFree = false : isBottomFree = false;
      });
      if (isBottomFree)
        seatList.add(
            Ticket(widget.bus.id, 'Нет имени', '', '', '', i, false, null));
      if (isTopFree)
        seatList
            .add(Ticket(widget.bus.id, 'Нет имени', '', '', '', i, true, null));
    }
  }

  Widget textField(text,
      {color = Colors.black, width = .9, align = TextAlign.start}) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton(
            onPressed: null,
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0))),
            child: TextFormField(
                textAlign: align,
                initialValue: text,
                cursorColor: Colors.green,
                style: GoogleFonts.roboto(
                    fontSize: 22.0, fontWeight: FontWeight.w500, color: color),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ))));
  }

  void displayBottomSheet(BuildContext context, seat) {
    String seatText = seat.isTopSeat ? ' верхний' : ' нижний';
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Container(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                textWidget('Информация о пассажире',
                    fontSize: 24.0, weight: FontWeight.w500),
                Divider(height: 30, thickness: 3.0),
                textField(seat.name),
                textField(seat.phone),
                textField(seat.contactType, color: Colors.green),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textWidget('Место', fontSize: 20.0, color: Colors.black54),
                    textWidget('Цена', fontSize: 20.0, color: Colors.black54),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textField(seat.seatNumber.toString() + seatText,
                        width: 0.4, align: TextAlign.center),
                    textField(seat.price, width: 0.4, align: TextAlign.center)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.34,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        child: textWidget('ИЗМЕНИТЬ',
                            fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        child: textWidget('ОТПРАВИТЬ ЧЕК',
                            fontSize: 20.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, child: cancelDialog(seat));
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    child: textWidget('ОТМЕНИТЬ ПОКУПКУ БИЛЕТА',
                        fontSize: 20.0, color: Colors.white),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    checkTickets();
    super.initState();
  }

  Widget passengerElement(seat) {
    String btnText = 'no type';
    if (seat.isOnline != null) btnText = seat.isOnline ? 'ONLINE' : 'OFFLINE';
    String seatType = seat.isTopSeat ? 'верхний' : 'нижний';
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.center,
              child: textWidget(seat.name, fontSize: 24.0)),
          Container(
            width: MediaQuery.of(context).size.width * 0.24,
            child: Column(
              children: [
                textWidget(seat.seatNumber.toString(), fontSize: 26.0),
                textWidget(seatType, fontSize: 16.0),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  displayBottomSheet(context, seat);
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor:
                        btnText == 'OFFLINE' ? Colors.black26 : Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child:
                    textWidget(btnText, fontSize: 24.0, color: Colors.white70),
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
                child: Row(children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: textWidget('Имя',
                          fontSize: 24.0,
                          weight: FontWeight.w500,
                          color: Colors.black54)),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.19,
                      child: textWidget('Место',
                          fontSize: 24.0,
                          weight: FontWeight.w500,
                          color: Colors.black54)),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: textWidget('Тип',
                          fontSize: 24.0,
                          weight: FontWeight.w500,
                          color: Colors.black54))
                ])),
            ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: seatList
                    .where(
                        (e) => e.busId == widget.bus.id && e.isOnline != null)
                    .map((seat) => passengerElement(seat))
                    .toList()),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: textWidget('Свободные места',
                    fontSize: 24.0, weight: FontWeight.w500)),
            ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: seatList
                    .where(
                        (e) => e.busId == widget.bus.id && e.isOnline == null)
                    .map((seat) => passengerElement(seat))
                    .toList()),
          ],
        ));
  }
}
