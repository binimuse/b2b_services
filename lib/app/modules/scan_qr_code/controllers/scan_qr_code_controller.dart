
import 'package:b2b_services/app/modules/home/data/model/getdriver_model.dart';
import 'package:get/get.dart';

class ScanQrCodeController extends GetxController {
  final count = 0.obs;
  late final Dropofforder dropofforder;

 
  @override
  void onInit() {
    getOrder();

    super.onInit();
  }


  void increment() => count.value++;

  void getOrder() async {
    dropofforder = Get.arguments['order'];
  }





}
