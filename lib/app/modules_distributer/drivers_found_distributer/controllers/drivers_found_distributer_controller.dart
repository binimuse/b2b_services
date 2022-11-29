import 'package:get/get.dart';

class DriversFoundDistributerController extends GetxController {
  var driverid = ''.obs;
  var status = ''.obs;
  var driver_image = ''.obs;
  var driver_name = ''.obs;
  var vehicle_type = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    driverid.value = Get.arguments["driver_id"];
    status.value = Get.arguments["status"];
    driver_image.value = Get.arguments["driver_image"];
    driver_name.value = Get.arguments["driver_name"];
    vehicle_type.value = Get.arguments["vehicle_type"];
    super.onInit();
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
