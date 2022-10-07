import 'package:get/get.dart';

import '../controllers/searching_drivers_distributer_controller.dart';

class SearchingDriversDistributerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( SearchingDriversDistributerController(),
    );
  }
}
