import 'package:get/get.dart';

import '../controllers/main_screen_distributer_controller.dart';

class MainScreenDistributerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenDistributerController>(
      () => MainScreenDistributerController(),
    );
  }
}
