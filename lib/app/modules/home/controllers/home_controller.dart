// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:b2b_services/app/common/firebase/firestore.dart';
import 'package:b2b_services/app/modules/home/data/mutation/acceptorrejectrequest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
      print(result.data);
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

  sendStatus() async {
    // print(int.parse(txtAge.text));
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(StatusMutation.status),
      ),
    );

    if (!result.hasException) {
      print("sendStatus ${result.data!["toggleDriverStatus"]["is_on"]}");
    } else {
      print(result.exception);
    }
  }

  void listenToDrivedRequest() {
    final snapShots =
        FirebaseFirestore.instance.collection("/driver_requests").snapshots();
    snapShots.listen(
      (event) {
        bool isRequestIdSameDriver = false;
        print("am here ${event.docs.length}");
        event.docs.forEach(
          (element) {
            print("current data: ${element.data()}");

            int requestDriverId = element.data()['driver_id'];

            if (requestDriverId == getDriver.first.id) {
              isRequestIdSameDriver = true;
            }
          },
        );

        isDriverRequestActive(isRequestIdSameDriver);
      },
    );

    FirebaseFirestore.instance
        .collection('/driver_requests')
        .doc("1a6a3ca6bd1b494bb466")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      print('Document dont exists on the database');
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
      }
    });
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
}
