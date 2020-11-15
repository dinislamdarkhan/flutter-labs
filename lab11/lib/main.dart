import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lab11/app_data.dart';
import 'package:lab11/busline.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _textTemp(text, [fontSize = 18.0, weight = FontWeight.normal]) {
    return Container(
        child: Text(text,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: fontSize,
              fontWeight: weight,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            )));
  }

  Widget cardTemplate(bus) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/${bus.icon}',
                            fit: BoxFit.fitHeight,
                            width: 150,
                            height: 200,
                          )),
                      SizedBox(height: 5),
                      _textTemp(bus.name, 20.0),
                      SizedBox(height: 5),
                      _textTemp(bus.carNumber, 18.0),
                      SizedBox(height: 5),
                      _textTemp(bus.seatNumber.toString() + ' мест', 18.0)
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _textTemp(bus.from + ' -', 24.0),
                          _textTemp(bus.to, 24.0),
                          SizedBox(height: 15),
                          _textTemp('Отправление', 20.0, FontWeight.bold),
                          SizedBox(height: 5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _textTemp(
                                    'Дата  -  ' +
                                        DateFormat('dd.MM.yyyy E')
                                            .format(bus.fromDateTime),
                                    18.0),
                                SizedBox(height: 5),
                                _textTemp(
                                    'Время  -  ' +
                                        DateFormat('HH:mm')
                                            .format(bus.fromDateTime),
                                    18.0)
                              ]),
                          SizedBox(height: 15),
                          _textTemp('Прибытие', 20.0, FontWeight.bold),
                          SizedBox(height: 5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _textTemp(
                                    'Дата  -  ' +
                                        DateFormat('dd.MM.yyyy E')
                                            .format(bus.toDateTime),
                                    18.0),
                                SizedBox(height: 5),
                                _textTemp(
                                    'Время  -  ' +
                                        DateFormat('HH:mm')
                                            .format(bus.toDateTime),
                                    18.0)
                              ])
                        ])
                  ])),
          FlatButton(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              onPressed: () {
                Widget cancelButton = FlatButton(
                    child: Text("НЕТ",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    });
                Widget continueButton = FlatButton(
                    child: Text("ДА",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0)),
                    onPressed: () => setState(() {
                          busList.remove(bus);
                          Navigator.of(context).pop();
                        }));

                AlertDialog alert = AlertDialog(
                    content: Text("Вы хотите удалить этот рейс?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 21.0)),
                    actions: [cancelButton, continueButton]);
                showDialog(context: context, builder: (context) => alert);
              },
              color: Colors.white,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.circular(7)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: _textTemp('Удалить рейс')))
        ]));
  }

  Widget _listTile(text, icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
          leading:
              new IconTheme(data: new IconThemeData(size: 40), child: icon),
          title: Text(text,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
          onTap: () => {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            toolbarHeight: 65.0,
            title: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Расписание',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 25.0))),
            centerTitle: true,
            backgroundColor: Colors.green),
        body: ListView(
          children: busList.map((bus) => cardTemplate(bus)).toList(),
        ),
        floatingActionButton: FlatButton(
            onPressed: () {},
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 00, 0, 50),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 105),
                child: Text('Добавить рейс',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400)))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: new Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                        child: Text('Test Company',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 28,
                                fontWeight: FontWeight.w500))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text('Aty Zhoni',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 36,
                                fontWeight: FontWeight.w800)))
                  ]),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black87, width: 2)))),
          _listTile('Продажа билетов', Icon(Icons.credit_card)),
          _listTile('Список администраторов', Icon(Icons.people)),
          _listTile(
            'Автобусы',
            Icon(Icons.departure_board),
          ),
          _listTile('Статистика', Icon(Icons.equalizer)),
          _listTile('Пассажиры', Icon(Icons.airline_seat_recline_extra)),
          _listTile('Расписание', Icon(Icons.date_range)),
          _listTile('История', Icon(Icons.library_books)),
          _listTile('Настройки', Icon(Icons.settings)),
        ])));
  }
}
