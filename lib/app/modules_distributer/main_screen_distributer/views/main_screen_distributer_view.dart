import 'package:b2b_services/app/modules_distributer/home_distributer/views/home_distributer_view.dart';
import 'package:b2b_services/app/modules_distributer/main_screen_distributer/views/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_screen_distributer_controller.dart';

class MainScreenDistributerView
    extends GetView<MainScreenDistributerController> {
  const MainScreenDistributerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomBar(
          currentIndex: controller.currentBottomIndex.value,
          onTap: (int index) {
            controller.setCurrentBottomIndex(index);
          },
        );
      }),
      body: IndexedStack(
        children: [
          HomeDistributerView(),
          HomeDistributerView(),
          HomeDistributerView(),
          HomeDistributerView(),
        ],
      ),
    );
  }
}
