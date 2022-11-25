class ItemsModel {
  late String id;
  late String quantity;
  late String sku;
  late String price;
  late String name;
  late String images;

  late List<VariantsModel>? variantsModel;
  ItemsModel({
    required this.id,
    required this.quantity,
    required this.sku,
    required this.price,
    required this.name,
    required this.images,
    this.variantsModel, 
   
  });
}

class VariantsModel {
  late String attributeName;
  late String attributeValue;

  VariantsModel({
    required this.attributeName,
    required this.attributeValue,
  });
}
