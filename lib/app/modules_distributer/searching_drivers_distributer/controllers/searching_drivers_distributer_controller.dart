import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_distributer/controllers/home_distributer_controller.dart';

class SearchingDriversDistributerController extends GetxController {
  HomeDistributerController homecontroller =
      Get.find<HomeDistributerController>();
  @override
  void onInit() {
    // listenToDrivedRequest();
    Future.delayed(
      Duration(seconds: 10),
      () {
        if (homecontroller.isdropofftrips.value == true) {
          Get.toNamed(Routes.DRIVERS_FOUND_DISTRIBUTER, arguments: {
            "driver_id": homecontroller.driverid.value,
            "driver_image": homecontroller.driver_image.value,
            "driver_name": homecontroller.driver_name.value,
            "status": homecontroller.status.value,
            "vehicle_type": homecontroller.vehicle_type.value,
            "dropoff_id": homecontroller.dropOffId.value,
          });
        } else {
          Get.dialog(AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text(
              'Warning',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            actions: [
              continueButton,
            ],
            content: const Text('No Driver Found Try Agin!!!!',
                style: TextStyle(fontSize: 13, color: Colors.black)),
          ));
        }
      },
    );
    super.onInit();
  }

  Widget continueButton = TextButton(
    child: Text("Ok"),
    onPressed: () {
      Get.back();
      Get.back();
      Get.back();
    },
  );
  // void listenToDrivedRequest() {

  //   final snapShots = FirebaseFirestore.instance
  //       .collection("driver_requests")
  //       .doc(getDriver.single.id)
  //       .snapshots();
  //   snapShots.listen(
  //     (event) {
  //       bool isRequestIdSameDriver = false;
  //       print("am here ${event.data()}");

  //       print("current data: ${event.data()}");

  //       if (event.data() == null) {
  //         //isDriverRequestActive(false);
  //       } else {
  //         if (event.data()!['status'] == 'PENDING') {
  //           isDriverRequestActive(true);
  //           fromName.value = event.data()!['from'];
  //           dropoff_id.value = event.data()!['dropoff_id'];

  //           // FlutterRingtonePlayer.play(
  //           //   android: AndroidSounds.notification,
  //           //   ios: IosSounds.glass,
  //           //   looping: true, // Android only - API >= 28
  //           //   volume: 0.1, // Android only - API >= 28
  //           //   asAlarm: false, // Android only - all APIs
  //           // );

  //           print("dropoff_id.value => ${dropoff_id.value}");
  //         } else if (event.data()!['status'] == 'ACCEPTED') {
  //           isDriverRequestActive(false);
  //           fromName.value = event.data()!['from'];
  //           dropoff_id.value = event.data()!['dropoff_id'];
  //           print("dropoff_id.value => ${dropoff_id.value}");

  //           // FlutterRingtonePlayer.play(
  //           //   android: AndroidSounds.notification,
  //           //   ios: IosSounds.glass,
  //           //   looping: true, // Android only - API >= 28
  //           //   volume: 0.1, // Android only - API >= 28
  //           //   asAlarm: false, // Android only - all APIs
  //           // );

  //           for (var i = 0;
  //               i < event.data()!['dropoff_order_destinations'].length;
  //               i++) {
  //             dropofforderdestinations.add(Dropofforderdestinations(
  //               orderId: event.data()!['dropoff_order_destinations'][i]
  //                   ["order_id"],
  //               retailer_name: event.data()!['dropoff_order_destinations'][i]
  //                   ["retailer_name"],
  //             ));
  //           }

  //           getDropOffs();
  //         } else {
  //           isDriverRequestActive(false);
  //         }
  //       }
  //     },
  //   );
  // }
}
