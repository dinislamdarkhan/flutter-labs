import 'package:lab11/busline.dart';

List<BusLine> busList = [
  BusLine(
      name: 'YUTONG',
      from: 'Асыката',
      to: 'Алматы',
      fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
      toDateTime: DateTime.parse("2020-02-07 06:10:00"),
      seatNumber: 32,
      carNumber: 'KZ 888 KN02',
      icon: 'bus1.jpg'),
  BusLine(
      name: 'End2End Test',
      from: 'Город X',
      to: 'Сарыагаш',
      fromDateTime: DateTime.parse("2020-02-06 19:30:00"),
      toDateTime: DateTime.parse("2020-02-07 18:36:00"),
      seatNumber: 53,
      carNumber: 'KZ 123 ABC',
      icon: 'bus2.jpg'),
  BusLine(
      name: 'YUTONG',
      from: 'Сарыагаш',
      to: 'Алматы',
      fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
      toDateTime: DateTime.parse("2020-02-07 06:10:00"),
      seatNumber: 32,
      carNumber: 'KZ 888 KN02',
      icon: 'bus3.jpg'),
];
