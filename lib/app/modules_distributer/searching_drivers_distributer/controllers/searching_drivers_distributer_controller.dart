import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchingDriversDistributerController extends GetxController {
  @override
  void onInit() {
    // listenToDrivedRequest();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Get.toNamed(Routes.DRIVERS_FOUND_DISTRIBUTER);
      },
    );
    super.onInit();
  }

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
