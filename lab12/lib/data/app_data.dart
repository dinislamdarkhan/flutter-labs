import 'package:lab12/data/busline.dart';
import 'package:lab12/data/ticket.dart';

List<BusLine> busList = [
  BusLine(
      id: 0,
      name: 'YUTONG',
      from: 'Асыката',
      to: 'Алматы',
      fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
      toDateTime: DateTime.parse("2020-02-07 06:10:00"),
      seatNumber: 32,
      carNumber: 'KZ 888 KN 02',
      icon: 'bus1.jpg'),
  BusLine(
      id: 1,
      name: 'End2End Test',
      from: 'Город X',
      to: 'Сарыагаш',
      fromDateTime: DateTime.parse("2020-02-06 19:30:00"),
      toDateTime: DateTime.parse("2020-02-07 18:36:00"),
      seatNumber: 53,
      carNumber: 'KZ 123 ABC',
      icon: 'bus2.jpg'),
  BusLine(
      id: 2,
      name: 'YUTONG',
      from: 'Сарыагаш',
      to: 'Алматы',
      fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
      toDateTime: DateTime.parse("2020-02-07 06:10:00"),
      seatNumber: 32,
      carNumber: 'KZ 888 KN 02',
      icon: 'bus3.jpg'),
];

List<Ticket> seatList = [
  Ticket(0, 'Aigerim', '77079282498', 'Почта', '3000', 0, true, false),
  Ticket(0, 'Arlan', '77079282498', 'Почта', '3000', 1, true, false),
  Ticket(0, 'ASSEL', '77079282498', 'Телефон', '3000', 1, false, true),
  Ticket(0, 'TEMIRLAN', '77079282498', 'Почта', '3000', 2, true, true),
];
