import 'package:get/get.dart';

import '../controllers/drivers_found_distributer_controller.dart';

class DriversFoundDistributerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriversFoundDistributerController>(
      () => DriversFoundDistributerController(),
    );
  }
}
