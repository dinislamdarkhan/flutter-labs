class BusLine {
  int id;
  String name;
  String from;
  String to;
  DateTime fromDateTime;
  DateTime toDateTime;
  int seatNumber;
  String carNumber;
  String icon;

  BusLine(
      {this.id,
      this.name,
      this.from,
      this.to,
      this.fromDateTime,
      this.toDateTime,
      this.seatNumber,
      this.carNumber,
      this.icon});
}
