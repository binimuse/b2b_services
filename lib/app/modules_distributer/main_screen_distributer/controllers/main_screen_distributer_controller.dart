import 'package:get/get.dart';

class MainScreenDistributerController extends GetxController {

  final currentBottomIndex = 0.obs;

  void setCurrentBottomIndex(int index) {
    currentBottomIndex(index);
  }

}
