// ignore_for_file: unrelated_type_equality_checks, non_constant_identifier_names

import 'dart:async';

import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:b2b_services/app/modules/home/data/mutation/acceptorrejectrequest.dart';
import 'package:b2b_services/app/modules/home/views/widgets/listofdeleivery.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/data/model/items_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../modules_distributer/home_distributer/data/model/order_model.dart';
import '../../../modules_distributer/home_distributer/data/mutation/getdropoffquery.dart';
import '../data/model/getdriver_model.dart';
import '../data/mutation/getdriver_mutuation.dart';
import '../data/mutation/starttrip.dart';
import '../data/mutation/status_mutuation.dart';

class HomeController extends GetxController {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final count = 0.obs;
  var status = false.obs;
  var isStatusOn = false.obs;
  var getDropOffss = false.obs;
  var isDriverRequestActiveForDropOff = false.obs;
  var isDriverRequestActiveForShipMent = false.obs;
  final GlobalKey<ScaffoldState> keyforall = GlobalKey<ScaffoldState>();
  var getDriver = <GestDriverModel>[].obs;
  var loadingDriver = false.obs;
  var fromName = "".obs;
  var toName = "".obs;
  var cost = "".obs;
  var dropoff_id = 0.obs;
  var shipment_id = 0.obs;
  Timer? timer;
  late GoogleMapController mapController;

  LatLng currentPosition = LatLng(9.0073117, 38.7476045);
  RxList<Dropofforderdestinations> dropofforderdestinations =
      List<Dropofforderdestinations>.of([]).obs;

  RxList<Dropofforder> dropOffOrder = List<Dropofforder>.of([]).obs;
  var itemModel = <ItemsModel>[].obs;
  var orderHistory = <OrderHistoryModel>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    FlutterRingtonePlayer.stop();
    FlutterRingtonePlayer.stop();
    checkGps();

    askforpermission();
    getUserId();

    sendStatus();

    super.onInit();
  }

  void getUserId() async {
    DriverMutation driverMutation = DriverMutation();
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.query(
      QueryOptions(
        document: gql(driverMutation.getMyUserId()),
      ),
    );

    if (!result.hasException) {
      getDriver.clear();

      loadingDriver(true);

      getDriver.add(GestDriverModel(
        id: result.data!["auth"]["driver"]["id"],
        name: result.data!["auth"]["driver"]["name"],
        city: result.data!["auth"]["driver"]["city"],
      ));

      if (isStatusOn.isTrue) {
        listenToDrivedRequestForDropOff();
        //  listenToDrivedRequestForShipMent();
      }
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

        // getLocation();
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
    isLoading(true);

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    print(location);

    currentPosition = location;
  }

  sendStatus() async {
    FlutterRingtonePlayer.stop();
    // print(int.parse(txtAge.text));
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(StatusMutation.status),
      ),
    );

    if (!result.hasException) {
      if (result.data!["toggleDriverStatus"]["is_on"] == true) {
        // status.value = true;
      } else {
        // status.value = false;
      }
      // print("sendStatus ${result.data!["toggleDriverStatus"]["is_on"]}");
    } else {
      print(result.exception);
    }
  }

  void listenToDrivedRequestForShipMent() {
    FlutterRingtonePlayer.stop();
    FlutterRingtonePlayer.stop();

    final snapShots = FirebaseFirestore.instance
        .collection("shipment_driver_requests")
        .doc(getDriver.single.id)
        .snapshots();
    snapShots.listen(
      (event) {
        if (event.data() == null) {
          isDriverRequestActiveForShipMent(false);
        } else {
          if (event.data()!['status'] == 'PENDING') {
            isDriverRequestActiveForShipMent(true);
            cost.value = event.data()!['cost'].toString();
            fromName.value = event.data()!['from'];
            shipment_id.value = event.data()!['shipment_id'];

            // FlutterRingtonePlayer.play(
            //   android: AndroidSounds.notification,
            //   ios: IosSounds.glass,
            //   looping: true, // Android only - API >= 28
            //   volume: 0.1, // Android only - API >= 28
            //   asAlarm: false, // Android only - all APIs
            // );

          } else if (event.data()!['status'] == 'DRIVER_ACCEPTED') {
            isDriverRequestActiveForShipMent(false);
            cost.value = event.data()!['cost'].toString();
            fromName.value = event.data()!['from'];
            toName.value = event.data()!['to'];
            shipment_id.value = event.data()!['shipment_id'];

            // FlutterRingtonePlayer.play(
            //   android: AndroidSounds.notification,
            //   ios: IosSounds.glass,
            //   looping: true, // Android only - API >= 28
            //   volume: 0.1, // Android only - API >= 28
            //   asAlarm: false, // Android only - all APIs
            // );

            for (var i = 0;
                i < event.data()!['dropoff_order_destinations'].length;
                i++) {
              dropofforderdestinations.add(Dropofforderdestinations(
                orderId: event.data()!['dropoff_order_destinations'][i]
                    ["order_id"],
                retailer_name: event.data()!['dropoff_order_destinations'][i]
                    ["retailer_name"],
              ));
            }

            getDropOffsss();
          } else {
            isDriverRequestActiveForShipMent(false);
          }
        }
      },
    );
  }

  void listenToDrivedRequestForDropOff() {
    FlutterRingtonePlayer.stop();
    FlutterRingtonePlayer.stop();
    print("TEST=> getDriver ${getDriver.length}");
    final snapShots = FirebaseFirestore.instance
        .collection("dropoff_driver_requests")
        .doc(getDriver.single.id)
        .snapshots();
    snapShots.listen(
      (event) {
        print("abiy  ${event.data()}");
        if (event.data() == null) {
          isDriverRequestActiveForDropOff(false);
        } else {
          if (event.data()!['status'] == 'PENDING') {
            isDriverRequestActiveForDropOff(true);
            cost.value = event.data()!['cost'].toString();
            fromName.value = event.data()!['from'];
            dropoff_id.value = event.data()!['dropoff_id'];

            FlutterRingtonePlayer.play(
              android: AndroidSounds.ringtone,
              ios: IosSounds.glass,
              looping: true, // Android only - API >= 28
              volume: 0.1, // Android only - API >= 28
              asAlarm: false, // Android only - all APIs
            );
          } else if (event.data()!['status'] == 'DRIVER_ACCEPTED') {
            isDriverRequestActiveForDropOff(false);
            cost.value = event.data()!['cost'].toString();
            fromName.value = event.data()!['from'];
            dropoff_id.value = event.data()!['dropoff_id'];

            // FlutterRingtonePlayer.play(
            //   android: AndroidSounds.ringtone,
            //   ios: IosSounds.glass,
            //   looping: true, // Android only - API >= 28
            //   volume: 0.1, // Android only - API >= 28
            //   asAlarm: false, // Android only - all APIs
            // );

            for (var i = 0;
                i < event.data()!['dropoff_order_destinations'].length;
                i++) {
              dropofforderdestinations.add(Dropofforderdestinations(
                orderId: event.data()!['dropoff_order_destinations'][i]
                    ["order_id"],
                retailer_name: event.data()!['dropoff_order_destinations'][i]
                    ["retailer_name"],
              ));
            }

            getDropOffsss();
          } else {
            isDriverRequestActiveForDropOff(false);
          }
        }
      },
    );
  }

  acceptDropoffRequest() async {
    // print(int.parse(txtAge.text));
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(AcceptDropoffRequest.request),
        variables: <String, dynamic>{
          'dropoff_id': dropoff_id.value.toString(),
        },
      ),
    );

    if (!result.hasException) {
      Get.to(() => ListOfDeleivery());
    } else {
      //Get.back();
      isDriverRequestActiveForDropOff(false);
      Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          result.exception!.graphqlErrors.first.extensions.toString(),
          style: TextStyle(fontSize: 18, color: Colors.green),
        ),
      ));
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
    } else {
      print(result.exception);
    }
  }

  // void getFakedata2() {
  //   itemModel.add(ItemsModel(
  //     id: '1',
  //     name: 'fdg',
  //     price: '343',
  //     quantity: '2',
  //     sku: '45',
  //     images: '',
  //   ));
  // }

  // void getFakedata() {
  //   orderHistory.add(OrderHistoryModel(id: "1", itemsmodel: itemModel));
  // }

  // void updateDropoff() async {
  //   GraphQLClient client = graphQLConfiguration.clientToQuery();
  //   QueryResult result = await client.mutate(
  //     MutationOptions(
  //       document: gql(UpdatedropoffMutation.updateDropoff),
  //       variables: <String, dynamic>{
  //         'id': '',
  //         'orders': {'received': "true", 'id': dropoff_id},
  //       },
  //     ),
  //   );
  //   if (!result.hasException) {
  //     // Get.toNamed(Routes.SEARCHING_DRIVERS_DISTRIBUTER);
  //   } else {
  //     print(result.exception);
  //   }
  // }

  RxList<ItemsModelOrder> itemModelorder = List<ItemsModelOrder>.of([]).obs;
  void getDropOffsss() async {
    print("dropoffid ${dropoff_id.value.toString()}");
    GetDropOff getDropOff = GetDropOff();
    GraphQLClient client = graphQLConfiguration.clientToQuery();
    QueryResult result = await client.query(
      QueryOptions(
        document: gql(getDropOff.dropoff(dropoff_id.value.toString())),
      ),
    );
    if (!result.hasException) {
      dropOffOrder.clear();
      for (var i = 0;
          i < result.data!["dropoff"]["dropoff_order"].length;
          i++) {
        for (var k = 0;
            k <
                result.data!["dropoff"]["dropoff_order"][i]["order"]["items"]
                    .length;
            k++) {
          itemModelorder.clear();
          itemModelorder.add(ItemsModelOrder(
            id: result.data!["dropoff"]["dropoff_order"][i]["order"]["items"][k]
                ["id"],
            images: "",
            name: result.data!["dropoff"]["dropoff_order"][i]["order"]["items"]
                [k]["product_sku"]["product"]["name"],
            price: result.data!["dropoff"]["dropoff_order"][i]["order"]["items"]
                    [k]["product_sku"]["price"]
                .toString(),
            quantity: result.data!["dropoff"]["dropoff_order"][i]["order"]
                    ["items"][k]["quantity"]
                .toString(),
            sku: result.data!["dropoff"]["dropoff_order"][i]["order"]["items"]
                [k]["product_sku"]["sku"],
          ));
        }

        dropOffOrder.add(Dropofforder(
            itemsmodel: itemModelorder,
            orderId: result.data!["dropoff"]["dropoff_order"][i]["order"]["id"],
            received: result.data!["dropoff"]["dropoff_order"][i]["received"]
                .toString(),
            totalPrice: result.data!["dropoff"]["dropoff_order"][i]["order"]
                    ["total_price"]
                .toString(),
            dropOffid: result.data!["dropoff"]["id"],
            status: result.data!["dropoff"]["status"],
            fromPhone: result.data!["dropoff"]["from"]["contact_phone"],
            fromname: result.data!["dropoff"]["from"]["name"]));
      }

      getDropOffss(true);
    } else {
      getDropOffss(false);
      print(result.exception);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
