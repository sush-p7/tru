class POHead {
  final String company;
  final bool openOrder;
  final int poNum;
  final String entryPerson;
  final String orderDate;
  final String shipName;
  final String shipCity;
  final String shipState;

  POHead({
    required this.company,
    required this.openOrder,
    required this.poNum,
    required this.entryPerson,
    required this.orderDate,
    required this.shipName,
    required this.shipCity,
    required this.shipState,
  });

  factory POHead.fromJson(Map<String, dynamic> json) {
    return POHead(
      company: json['Company'],
      openOrder: json['OpenOrder'],
      poNum: json['PONum'],
      entryPerson: json['EntryPerson'],
      orderDate: json['OrderDate'],
      shipName: json['ShipName'],
      shipCity: json['ShipCity'],
      shipState: json['ShipState'],
    );
  }
}
