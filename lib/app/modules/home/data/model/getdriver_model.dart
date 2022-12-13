// ignore_for_file: non_constant_identifier_names

class GestDriverModel {
  late String id;
  late String name;

  late String city;

  GestDriverModel({
    required this.id,
    required this.name,
    required this.city,
  });
}

class Dropofforderdestinations {
  late String orderId;
  late String retailer_name;

  Dropofforderdestinations({
    required this.orderId,
    required this.retailer_name,
  });
}

class Shipmentorderdestinations {
  late String orderId;
  late String retailer_name;

  Shipmentorderdestinations({
    required this.orderId,
    required this.retailer_name,
  });
}

class Dropofforder {
  late String dropOffid;
  late String orderId;
  late String received;
  late String status;
  late String totalPrice;
  late String fromname;
  late String fromPhone;
  late List<ItemsModelOrder> itemsmodel;

  Dropofforder({
    required this.dropOffid,
    required this.orderId,
    required this.received,
    required this.status,
    required this.itemsmodel,
    required this.totalPrice,
    required this.fromname,
    required this.fromPhone,
  });
}

class ItemsModelOrder {
  late String id;
  late String quantity;
  late String sku;
  late String price;
  late String name;
  late String images;

  ItemsModelOrder({
    required this.id,
    required this.quantity,
    required this.sku,
    required this.price,
    required this.name,
    required this.images,
  });
}
