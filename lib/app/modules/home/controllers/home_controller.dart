import 'dart:async';

import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:b2b_services/app/common/firebase/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../data/model/getdriver_model.dart';
import '../data/mutation/getdriver_mutuation.dart';

class HomeController extends GetxController {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final count = 0.obs;
  var status = false.obs;
  var isDriverRequestActive = false.obs;
  final GlobalKey<ScaffoldState> keyforall = GlobalKey<ScaffoldState>();
  var getDriver = <GestDriverModel>[].obs;
  var loadingDriver = false.obs;
  @override
  void onInit() {
    listenToDrivedRequest();

    askforpermission();
    getUserId();
    //checkGps();
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

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
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
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    update();

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      update();
    });
  }

  sendStatus(bool value) async {}

  void listenToDrivedRequest() {
    final snapShots =
        FirebaseFirestore.instance.collection("driver_requests").snapshots();
    snapShots.listen(
      (event) {

       bool isRequestIdSameDriver = false;

        event.docs.forEach(
          (element) {

            print("current data: ${element.data()}");

            int requestDriverId = element.data()['driver_id'];

            if(requestDriverId == 12){
              isRequestIdSameDriver=true;
            }


          },
        );

       isDriverRequestActive(isRequestIdSameDriver);

      },
    );
  }
}
