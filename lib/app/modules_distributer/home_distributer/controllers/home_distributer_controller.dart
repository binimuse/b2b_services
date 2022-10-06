import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../Services/graphql_conf.dart';
import '../../../constant/reusable_widget.dart';
import '../data/model/order_model.dart';
import '../data/mutation/order_deatil_mutuation.dart';
import '../data/mutation/shipment_model.dart';

class HomeDistributerController extends GetxController {
  final count = 0.obs;
  var loadingShipmentDeatil = false.obs;
  final reusableWidget = ReusableWidget();
  var loading = true.obs;

  Timer? timerDummy;
  late TabController tabController;
  List<ShipModel> shipModel = [];
  List<OrderHistoryModel> orderData = [];
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();


  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    GetdistributorMutation getdistributorMutation = GetdistributorMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(getdistributorMutation.getMydistributor()),
      ),
    );

    if (!result.hasException) {
      for (var i = 0;
          i < result.data!["auth"]["distributor"]["shipmentsTo"].length;
          i++) {
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
        ));
      }

      loadingShipmentDeatil(true);
    } else {
      loadingShipmentDeatil(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
