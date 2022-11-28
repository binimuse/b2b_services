import 'package:b2b_services/app/modules/home/data/model/getdriver_model.dart';
import 'package:get/get.dart';

class ScanQrCodeController extends GetxController {
  late final Dropofforder? dropofforder;
  final count = 0.obs;
  @override
  void onInit() {
    print("amhere");
    getOrder();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void getOrder() async {
    print("hahauuuu ${"dropofforder!.orderId"}");
    dropofforder = Get.arguments['order'];
    print("hahauuuu ${dropofforder!.orderId}");
    print("hahauuuu ${dropofforder!.dropOffid}");
  }
}
