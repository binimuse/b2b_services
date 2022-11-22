import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/helper/keyboard.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/controllers/arrived_page_distributer_controller.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/arrived_page_distributer_view.dart';
import 'package:b2b_services/app/modules_distributer/delivred_page_distributer/controllers/delivred_page_distributer_controller.dart';
import 'package:b2b_services/app/modules_distributer/delivred_page_distributer/views/delivred_page_distributer_view.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/controllers/home_distributer_controller.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/views/home_distributer_view.dart';
import 'package:b2b_services/app/modules_distributer/main_screen_distributer/views/widgets/bottom_bar.dart';
import 'package:b2b_services/app/modules_distributer/shipped_page_distributer/controllers/shipped_page_distributer_controller.dart';
import 'package:b2b_services/app/modules_distributer/shipped_page_distributer/views/shipped_page_distributer_view.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/main_screen_distributer_controller.dart';

class MainScreenDistributerView
    extends GetView<MainScreenDistributerController> {
  const MainScreenDistributerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.currentBottomIndex.value != null
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: CustomColors.white,
              systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
              title: Text(
                controller.currentBottomIndex.value == 0
                    ? 'Incoming Items'
                    : controller.currentBottomIndex.value == 1
                        ? 'Confirmed Items'
                        : controller.currentBottomIndex.value == 2
                            ? 'Shiped Items'
                            : 'Deliverd Items',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: false,
              actions: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: CustomSizes.mp_v_1),
                  width: CustomSizes.icon_size_12,
                  height: CustomSizes.icon_size_12,
                  child: Material(
                    elevation: 4,
                    color: CustomColors.blue,
                    borderRadius: BorderRadius.circular(CustomSizes.radius_6),
                    child: CustomButtonFeedBack(
                      onTap: () {},
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.solidTruckFast,
                          color: CustomColors.white,
                          size: CustomSizes.icon_size_4,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: CustomSizes.mp_w_4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: CustomSizes.mp_v_1),
                  width: CustomSizes.icon_size_12,
                  height: CustomSizes.icon_size_12,
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(CustomSizes.radius_6),
                    child: CustomButtonFeedBack(
                      onTap: () {
                        Get.toNamed(Routes.NOTIFICATION);
                      },
                      child: Icon(
                        FontAwesomeIcons.solidBell,
                        color: CustomColors.blue,
                        size: CustomSizes.icon_size_6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: CustomSizes.mp_w_4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: CustomSizes.mp_v_1),
                  width: CustomSizes.icon_size_12,
                  height: CustomSizes.icon_size_12,
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(CustomSizes.radius_6),
                    child: CustomButtonFeedBack(
                      onTap: () {
                        Get.toNamed(Routes.MY_PROFILE);
                      },
                      child: Icon(
                        FontAwesomeIcons.solidGear,
                        color: CustomColors.blue,
                        size: CustomSizes.icon_size_6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: CustomSizes.mp_w_4,
                ),
              ],
            ),
            bottomNavigationBar: Obx(() {
              return BottomBar(
                currentIndex: controller.currentBottomIndex.value,
                onTap: (int index) {
                  controller.setCurrentBottomIndex(index);
                },
              );
            }),
            body: Obx(() {
              return Column(
                children: [
                  SizedBox(
                    height: CustomSizes.mp_v_1,
                  ),

                  ///INDEXED STACK TO CHANGE PAGES
                  Expanded(
                    child: IndexedStack(
                      index: controller.currentBottomIndex.value,
                      children: [
                        HomeDistributerView(),
                        ArrivedPageDistributerView(),
                        ShippedPageDistributerView(),
                        DelivredPageDistributerView(),
                      ],
                    ),
                  ),
                ],
              );
            }),
          )
        : SizedBox());
  }

  Padding buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Incoming Items',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                elevation: 4,
                color: CustomColors.blue,
                borderRadius: BorderRadius.circular(CustomSizes.radius_6),
                child: CustomButtonFeedBack(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(
                      CustomSizes.mp_w_4,
                    ),
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.solidTruckFast,
                        color: CustomColors.white,
                        size: CustomSizes.icon_size_6,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: CustomSizes.mp_w_4,
              ),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(CustomSizes.radius_6),
                child: CustomButtonFeedBack(
                  onTap: () {
                    Get.back();
                    KeyboardUtil.hideKeyboard(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                      CustomSizes.mp_w_4,
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidBell,
                      color: CustomColors.blue,
                      size: CustomSizes.icon_size_6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
