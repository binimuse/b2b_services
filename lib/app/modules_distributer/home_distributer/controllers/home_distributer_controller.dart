// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:b2b_services/app/modules_distributer/home_distributer/data/model/items_model.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/data/model/vehicle_type_model.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../Services/graphql_conf.dart';
import '../../../constant/reusable_widget.dart';
import '../data/model/order_model.dart';
import '../data/mutation/createDropoffmuataion.dart';
import '../data/mutation/order_deatil_mutuation.dart';
import '../data/model/shipment_model.dart';
import '../data/mutation/vehcile_mutuation.dart';

class HomeDistributerController extends GetxController {
  final count = 0.obs;
  final selectedCarIndex = 1000.obs;
  var vehicleID = ''.obs;
  var userId = ''.obs;
  var dropOffId = ''.obs;

  List<String> orderId = <String>[].obs;
  var loadingShipmentDeatil = false.obs;
  var loadingOrder = false.obs;
  var loadindvehicleType = false.obs;
  var isdropofftrips = false.obs;
  final reusableWidget = ReusableWidget();

  var isLoading = false.obs;
  Timer? timerDummy;
  late TabController tabController;

  RxList<ShipModel> shipModel = List<ShipModel>.of([]).obs;
  RxList<VehicleTypesModel> vehicleModel = List<VehicleTypesModel>.of([]).obs;

  RxList<ItemsModel> itemModel = List<ItemsModel>.of([]).obs;
  RxList<ItemsModel> itemModelorder = List<ItemsModel>.of([]).obs;
  RxList<VariantsModel> variantsModel = List<VariantsModel>.of([]).obs;

  RxList<OrderHistoryModel> orderData = List<OrderHistoryModel>.of([]).obs;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  void onInit() {
    fetchAll();
    super.onInit();
  }

  fetchAll() {
    getData();
    getvehicleTypes();
    getOrder();
  }

  void getData() async {
    GetdistributorMutation getdistributorMutation = GetdistributorMutation();
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.query(
      QueryOptions(
        document: gql(getdistributorMutation.getMydistributor()),
      ),
    );

    if (!result.hasException) {
      userId.value = result.data!["auth"]["distributor"]["id"];
      shipModel.clear();
      itemModel.clear();
      for (var i = 0;
          i < result.data!["auth"]["distributor"]["shipmentsTo"].length;
          i++) {
        for (var k = 0;
            k <
                result.data!["auth"]["distributor"]["shipmentsTo"][i]["items"]
                    .length;
            k++) {
          for (var v = 0;
              v <
                  result
                      .data!["auth"]["distributor"]["shipmentsTo"][i]["items"]
                          [k]["shipment_itemable"]["product_sku"]["variants"]
                      .length;
              v++) {
            variantsModel.clear();
            variantsModel.add(VariantsModel(
              attributeName: result.data!["auth"]["distributor"]["shipmentsTo"]
                      [i]["items"][k]["shipment_itemable"]["product_sku"]
                  ["variants"][v]["attribute"]["name"],
              attributeValue: result.data!["auth"]["distributor"]["shipmentsTo"]
                      [i]["items"][k]["shipment_itemable"]["product_sku"]
                  ["variants"][v]["attributeValue"]["value"],
            ));
          }

          itemModel.add(ItemsModel(
              id: result.data!["auth"]["distributor"]["shipmentsTo"][i]["items"]
                  [k]["id"],
              images: result.data!["auth"]["distributor"]["shipmentsTo"][i]
                      ["items"][k]["shipment_itemable"]["product_sku"]
                  ["product"]["images"][0]["original_url"],
              name: result.data!["auth"]["distributor"]["shipmentsTo"][i]["items"]
                  [k]["shipment_itemable"]["product_sku"]["product"]["name"],
              price:
                  result.data!["auth"]["distributor"]["shipmentsTo"][i]["items"][k]["shipment_itemable"]["product_sku"]["price"].toString(),
              quantity: result.data!["auth"]["distributor"]["shipmentsTo"][i]["items"][k]["shipment_itemable"]["quantity"].toString(),
              sku: result.data!["auth"]["distributor"]["shipmentsTo"][i]["items"][k]["shipment_itemable"]["product_sku"]["sku"],
              variantsModel: variantsModel));
        }
        shipModel.add(ShipModel(
          shipmentID: result.data!["auth"]["distributor"]["shipmentsTo"][i]
              ["id"],
          departure_time: result.data!["auth"]["distributor"]["shipmentsTo"][i]
              ["departure_time"],
          arrival_time: result.data!["auth"]["distributor"]["shipmentsTo"][i]
              ["arrival_time"],
          status: result.data!["auth"]["distributor"]["shipmentsTo"][i]
              ["status"],
          from: result.data!["auth"]["distributor"]["shipmentsTo"][i]["from"]
              ["__typename"],
          itemModel: itemModel,
        ));

        loadingShipmentDeatil(true);
      }
    } else {
      print(result.exception);
      loadingShipmentDeatil(false);
    }
  }

  void getOrder() async {
    GetOrderrMutation getOrderrMutation = GetOrderrMutation();
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.query(
      QueryOptions(
        document: gql(getOrderrMutation.getMyorder()),
      ),
    );

    if (!result.hasException) {
      orderData.clear();

      for (var i = 0;
          i < result.data!["auth"]["distributor"]["orders"].length;
          i++) {
        orderData.add(OrderHistoryModel(
            id: result.data!["auth"]["distributor"]["orders"][i]["id"],
            itemsmodel: itemModelorder));
        for (var k = 0;
            k <
                result
                    .data!["auth"]["distributor"]["orders"][i]["items"].length;
            k++) {
          itemModelorder.add(ItemsModel(
            id: result.data!["auth"]["distributor"]["orders"][i]["items"][k]
                ["id"],
            images: result.data!["auth"]["distributor"]["orders"][i]["items"][k]
                ["product_sku"]["product"]["images"][0]["original_url"],
            name: result.data!["auth"]["distributor"]["orders"][i]["items"][k]
                ["product_sku"]["product"]["name"],
            price: result.data!["auth"]["distributor"]["orders"][i]["items"][k]
                    ["product_sku"]["price"]
                .toString(),
            quantity: result.data!["auth"]["distributor"]["orders"][i]["items"]
                    [k]["quantity"]
                .toString(),
            sku: result.data!["auth"]["distributor"]["orders"][i]["items"][k]
                ["product_sku"]["sku"],
          ));

          print("fdfdf ${orderData.length}");

          loadingOrder(true);
        }
      }
    } else {
      print(result.exception);
      loadingOrder(false);
    }
  }

  void getvehicleTypes() async {
    VehicleTypesMutation vehicleTypesMutation = VehicleTypesMutation();
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.query(
      QueryOptions(
        document: gql(vehicleTypesMutation.getMyCvehicleTypes(10, 1)),
      ),
    );

    if (!result.hasException) {
      vehicleModel.clear();

      for (var i = 0; i < result.data!["vehicleTypes"]["data"].length; i++) {
        vehicleModel.add(VehicleTypesModel(
          id: result.data!["vehicleTypes"]["data"][i]["id"],
          title: result.data!["vehicleTypes"]["data"][i]["title"],
          image: result.data!["vehicleTypes"]["data"][i]["image"],
        ));

        loadindvehicleType(true);
      }
    } else {
      print("ghgh ${variantsModel.length}");
      print(result.exception);
      loadindvehicleType(false);
    }
  }

  void createDropoff() async {
    isLoading(true);
    GraphQLClient client = graphQLConfiguration.clientToQuery();
    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(CreateDropoffMutation.createDropoff),
        variables: <String, dynamic>{
          'vehicle_type': {'connect': vehicleID.value},
          'from': {
            'connect': {
              'type': "DISTRIBUTOR",
              'id': userId.value,
            }
          },
          'orders': {"ids": orderId},
        },
      ),
    );
    if (!result.hasException) {
      isLoading(true);

      dropOffId.value = result.data!["createDropoff"]["id"];

      dropofftrips();
      isLoading(false);
    } else {
      isLoading(false);
      Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text(
          'Error',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
        content: Text(result.exception!.graphqlErrors[0].message.toString(),
            style: TextStyle(fontSize: 13, color: Colors.black)),
      ));
    }
  }

  var driverid = ''.obs;
  var status = ''.obs;
  var driver_image = ''.obs;
  var driver_name = ''.obs;
  var vehicle_type = ''.obs;

  void dropofftrips() {
    Get.toNamed(Routes.SEARCHING_DRIVERS_DISTRIBUTER);

    final snapShots = FirebaseFirestore.instance
        .collection("dropoff_trips")
        .doc(dropOffId.value)
        .snapshots();
    snapShots.listen(
      (event) {
        if (event.data() == null) {
          isdropofftrips(false);

          final snapShots = FirebaseFirestore.instance
              .collection("shipment_trips")
              .doc(dropOffId.value)
              .snapshots();
          snapShots.listen(
            (event) {
              if (event.data() != null) {
                driverid.value = event.data()!['driver_id'].toString();
                driver_image.value = event.data()!['driver_image'].toString();
                driver_name.value = event.data()!['driver_name'].toString();
                vehicle_type.value = event.data()!['vehicle_type'].toString();
                status.value = event.data()!['status'].toString();

                isdropofftrips(true);
              }
            },
          );
        } else {
          driverid.value = event.data()!['driver_id'].toString();
          driver_image.value = event.data()!['driver_image'].toString();
          driver_name.value = event.data()!['driver_name'].toString();
          vehicle_type.value = event.data()!['vehicle_type'].toString();
          status.value = event.data()!['status'].toString();

          isdropofftrips(true);
        }
      },
    );
  }

  void increment() => count.value++;
}
