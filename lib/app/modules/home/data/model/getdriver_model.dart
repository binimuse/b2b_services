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

class Dropofforder {
  late String orderId;
  late String received;
  late List<ItemsModelOrder> itemsmodel;

  Dropofforder({
    required this.orderId,
    required this.received,
    required this.itemsmodel,
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
