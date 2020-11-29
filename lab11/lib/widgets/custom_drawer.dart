import 'package:flutter/material.dart';
import 'package:lab11/pages/schedule_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _listTile(text, icon, linkName) {
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
            onTap: () => Navigator.pushNamed(context, linkName)),
      );
    }

    return Drawer(
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
              border:
                  Border(bottom: BorderSide(color: Colors.black87, width: 2)))),
      _listTile('Продажа билетов', Icon(Icons.credit_card), ''),
      _listTile('Список администраторов', Icon(Icons.people), ''),
      _listTile('Автобусы', Icon(Icons.departure_board), ''),
      _listTile('Статистика', Icon(Icons.equalizer), ''),
      _listTile('Пассажиры', Icon(Icons.airline_seat_recline_extra),
          SchedulePage.routePassenger),
      _listTile(
          'Расписание', Icon(Icons.date_range), SchedulePage.routeSchedule),
      _listTile('История', Icon(Icons.library_books), ''),
      _listTile('Настройки', Icon(Icons.settings), ''),
    ]));
  }
}
