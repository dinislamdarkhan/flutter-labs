class Ticket {
  int busId;
  String name;
  String phone;
  String contactType;
  String price;
  int seatNumber;
  bool isTopSeat;
  bool isOnline;

  Ticket(this.busId, this.name, this.phone, this.contactType, this.price,
      this.seatNumber, this.isTopSeat, this.isOnline);
}
