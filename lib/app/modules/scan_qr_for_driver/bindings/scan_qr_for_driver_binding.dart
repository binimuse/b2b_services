import 'package:get/get.dart';

import '../controllers/scan_qr_for_driver_controller.dart';

class ScanQrForDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanQrForDriverController>(
      () => ScanQrForDriverController(),
    );
  }
}
