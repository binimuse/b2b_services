import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SearchingDriversDistributerController extends GetxController {
  @override
  void onInit() {

    print("FOUNDEDEDED => ");
    Future.delayed(
      Duration(seconds: 5),
        (){
        Get.toNamed(Routes.DRIVERS_FOUND_DISTRIBUTER);
        },
    );
    super.onInit();
  }
}
