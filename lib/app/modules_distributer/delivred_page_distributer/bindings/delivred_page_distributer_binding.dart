import 'package:get/get.dart';

import '../controllers/delivred_page_distributer_controller.dart';

class DelivredPageDistributerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DelivredPageDistributerController>(
      () => DelivredPageDistributerController(),
    );
  }
}
