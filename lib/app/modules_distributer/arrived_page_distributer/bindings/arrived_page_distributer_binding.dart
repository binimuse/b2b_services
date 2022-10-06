import 'package:get/get.dart';

import '../controllers/arrived_page_distributer_controller.dart';

class ArrivedPageDistributerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArrivedPageDistributerController>(
      () => ArrivedPageDistributerController(),
    );
  }
}
