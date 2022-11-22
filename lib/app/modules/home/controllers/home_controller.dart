import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../my_profile/data/mutation/getuserid_mutuation.dart';
import '../data/model/getdriver_model.dart';
import '../data/mutation/getdriver_mutuation.dart';

class HomeController extends GetxController {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final count = 0.obs;
  var status = false.obs;
  final GlobalKey<ScaffoldState> keyforall = GlobalKey<ScaffoldState>();
  var getDriver = <GestDriverModel>[].obs;
  var loadingDriver = false.obs;
  @override
  void onInit() {
    askforpermission();
    getUserId();
    super.onInit();
  }

  void getUserId() async {
    DriverMutation driverMutation = DriverMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(driverMutation.getMyUserId()),
      ),
    );

    if (!result.hasException) {
      loadingDriver(true);

      getDriver.add(GestDriverModel(
        id: result.data!["auth"]["driver"]["id"],
        name: result.data!["auth"]["driver"]["name"],
        city: result.data!["auth"]["driver"]["city"],
      ));

      print("hahah ${getDriver[0].name}");
    } else {
      print(result.exception);
      loadingDriver(false);
    }
  }

  Future askforpermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  void increment() => count.value++;
}
