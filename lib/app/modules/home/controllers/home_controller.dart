// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:b2b_services/app/common/firebase/firestore.dart';
import 'package:b2b_services/app/modules/home/data/mutation/acceptorrejectrequest.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/data/model/items_model.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/data/mutation/updatedropoffmuataion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../modules_distributer/home_distributer/data/model/order_model.dart';
import '../data/model/getdriver_model.dart';
import '../data/mutation/getdriver_mutuation.dart';
import '../data/mutation/status_mutuation.dart';

class HomeController extends GetxController {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final count = 0.obs;
  var status = false.obs;
  var isDriverRequestActive = false.obs;
  final GlobalKey<ScaffoldState> keyforall = GlobalKey<ScaffoldState>();
  var getDriver = <GestDriverModel>[].obs;
  var loadingDriver = false.obs;

  late GoogleMapController mapController;

  late LatLng currentPosition = LatLng(0, 0);

  var itemModel = <ItemsModel>[].obs;
  var orderHistory = <OrderHistoryModel>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    checkGps();

    askforpermission();
    getUserId();
    getFakedata();
    getFakedata2();
    sendStatus();
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
      print(result.data);
      loadingDriver(true);

      print("result.data => ${result.data!["auth"]["driver"]["id"]}");

      getDriver.add(GestDriverModel(
        id: result.data!["auth"]["driver"]["id"],
        name: result.data!["auth"]["driver"]["name"],
        city: result.data!["auth"]["driver"]["city"],
      ));

      listenToDrivedRequest();

      print("d ${getDriver[0].name}");
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

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;

  late StreamSubscription<Position> positionStream;
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        update();

        getLocation();
      }
    } else {
      status.value = false;
      Get.defaultDialog(
          title: "Error",
          middleText: "GPS Service is not enabled, turn on GPS location",
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
          radius: 30);
      print("GPS Service is not enabled, turn on GPS location");
    }

    update();
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    currentPosition = location;
    isLoading(true);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  sendStatus() async {
    // print(int.parse(txtAge.text));
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(StatusMutation.status),
      ),
    );

    if (!result.hasException) {
      if (result.data!["toggleDriverStatus"]["is_on"] == true) {
        status.value = true;
      } else {
        status.value = false;
      }
      print("sendStatus ${result.data!["toggleDriverStatus"]["is_on"]}");
    } else {
      print(result.exception);
    }
  }

  void listenToDrivedRequest() {
    print("TEST=> getDriver ${getDriver.length}");
    final snapShots = FirebaseFirestore.instance
        .collection("/driver_requests")
        .doc(getDriver.first.id)
        .snapshots();
    snapShots.listen(
      (event) {
        bool isRequestIdSameDriver = false;
        print("am here ${event.data()}");

        print("current data: ${event.data()}");

        // int requestDriverId = event.data();

        // if (requestDriverId == getDriver.first.id) {
        //   isRequestIdSameDriver = true;
        // }

        //isDriverRequestActive(isRequestIdSameDriver);
      },
    );
  }

  acceptDropoffRequest() async {
    // print(int.parse(txtAge.text));
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(AcceptDropoffRequest.request),
      ),
    );

    if (!result.hasException) {
      print("sendStatus ${result.data!["toggleDriverStatus"]["is_on"]}");
    } else {
      print(result.exception);
    }
  }

  rejectDropoffRequest() async {
    // print(int.parse(txtAge.text));
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(RejectDropoffRequest.request),
      ),
    );

    if (!result.hasException) {
      print("sendStatus ${result.data!["toggleDriverStatus"]["is_on"]}");
    } else {
      print(result.exception);
    }
  }

  void getFakedata2() {
    itemModel.add(ItemsModel(
      id: '1',
      name: 'fdg',
      price: '343',
      quantity: '2',
      sku: '45',
      images: '',
    ));
  }

  void getFakedata() {
    orderHistory.add(OrderHistoryModel(id: "1", itemsmodel: itemModel));
  }

  void updateDropoff() async {
    GraphQLClient client = graphQLConfiguration.clientToQuery();
    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(UpdatedropoffMutation.updateDropoff),
        variables: <String, dynamic>{
          'orders': {'received': "", 'id': ""},
        },
      ),
    );
    if (!result.hasException) {
      // Get.toNamed(Routes.SEARCHING_DRIVERS_DISTRIBUTER);
    } else {
      print(result.exception);
    }
  }
}
