class ShipModel {
  late var shipmentID;
  late String departure_time;
  late String arrival_time;
  late String status;
  late String from;

  ShipModel({
    required this.shipmentID,
    required this.departure_time,
    required this.arrival_time,
    required this.status,
    required this.from,
  });
}
