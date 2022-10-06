import 'package:get/get.dart';

import '../controllers/home_distributer_controller.dart';

class HomeDistributerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDistributerController>(
      () => HomeDistributerController(),
    );
  }
}
