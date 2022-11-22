// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  var acc;
  var role;
  final count = 0.obs;

  void checkIfLogin() async {
    final prefs = await SharedPreferences.getInstance();

    acc = prefs.getString('access_token');
    role = prefs.getString('role');

    if (acc != null && role == "distributor") {
      Get.toNamed(Routes.MAIN_SCREEN_DISTRIBUTER);
    } else if (acc != null && role == "driver") {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.SIGN_IN);
      //  Get.toNamed(Routes.HOME);
    }
  }


  @override
  void onClose() {}
  void increment() => count.value++;
}
