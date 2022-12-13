// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class DriversFoundDistributerController extends GetxController {
  var driverid = ''.obs;
  var status = ''.obs;
  var driver_image = ''.obs;
  var driver_name = ''.obs;
  var vehicle_type = ''.obs;
  var dropOFFId = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    driverid.value = Get.arguments["driver_id"];
    status.value = Get.arguments["status"];
    driver_image.value = Get.arguments["driver_image"];
    driver_name.value = Get.arguments["driver_name"];
    vehicle_type.value = Get.arguments["vehicle_type"];
    dropOFFId.value = Get.arguments["dropoff_id"];
    super.onInit();
  }



  void increment() => count.value++;
}
