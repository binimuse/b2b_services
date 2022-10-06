import 'package:get/get.dart';

import '../controllers/shipped_page_distributer_controller.dart';

class ShippedPageDistributerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShippedPageDistributerController>(
      () => ShippedPageDistributerController(),
    );
  }
}
