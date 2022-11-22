import 'items_model.dart';

class OrderHistoryModel {
  late String id;
  late List<ItemsModel> itemsmodel;

  OrderHistoryModel({
    required this.id,
    required this.itemsmodel,
  });
}
