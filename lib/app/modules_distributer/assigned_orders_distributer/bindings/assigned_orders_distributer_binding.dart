import 'package:get/get.dart';

import '../controllers/assigned_orders_distributer_controller.dart';

class AssignedOrdersDistributerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignedOrdersDistributerController>(
      () => AssignedOrdersDistributerController(),
    );
  }
}
