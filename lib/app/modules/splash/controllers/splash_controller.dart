import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  var acc;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void checkIfLogin() async {
    final prefs = await SharedPreferences.getInstance();

    acc = prefs.getString('access_token');

    if (acc != null) {
      Get.toNamed(Routes.MAIN_SCREEN_DISTRIBUTER);
    } else {
      Get.toNamed(Routes.SIGN_IN);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
