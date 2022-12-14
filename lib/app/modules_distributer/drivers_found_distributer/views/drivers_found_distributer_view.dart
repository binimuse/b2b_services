// ignore_for_file: unrelated_type_equality_checks

import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/helper/keyboard.dart';
import 'package:b2b_services/app/modules_distributer/drivers_found_distributer/views/widgets/item_founded_driver.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/drivers_found_distributer_controller.dart';

class DriversFoundDistributerView
    extends GetView<DriversFoundDistributerController> {
  const DriversFoundDistributerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
        toolbarHeight: 0.0,
      ),
      body: controller.driver_image != ""
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///BUILD APP BAR
                buildAppBar(context),

                Expanded(
                  child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(top: CustomSizes.mp_v_2)
                            : EdgeInsets.zero,
                        child: ItemFoundedDriver(
                          driver_Image: controller.driver_image.toString(),
                          driver_name: controller.driver_name.toString(),
                          vehicle_type: controller.vehicle_type.toString(),
                          status: controller.status.toString(),
                          dropoffId: controller.dropOFFId.toString(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: CustomSizes.mp_v_2,
                      );
                    },
                    itemCount: 1,
                  ),
                )
              ],
            )
          : Center(
              child: Text(
                "No Driver Found",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: CustomColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: CustomSizes.font_12,
                    ),
              ),
            ),
    );
  }

  Padding buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (() {
              Get.back();
              KeyboardUtil.hideKeyboard(context);
            }),
            child: Padding(
              padding: EdgeInsets.all(CustomSizes.mp_w_2),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(CustomSizes.radius_6),
                child: Padding(
                  padding: EdgeInsets.all(
                    CustomSizes.mp_w_4,
                  ),
                  child: CustomButtonFeedBack(
                    onTap: () {
                      Get.back();
                      KeyboardUtil.hideKeyboard(context);
                    },
                    child: Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: CustomColors.blue,
                      size: CustomSizes.icon_size_4,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Driver Found',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: EdgeInsets.all(CustomSizes.mp_w_2),
            child: Material(
              elevation: 4,
              color: CustomColors.white,
              borderRadius: BorderRadius.circular(CustomSizes.radius_6),
              child: CustomButtonFeedBack(
                onTap: () {
                  Get.toNamed(Routes.NOTIFICATION);
                },
                child: Padding(
                  padding: EdgeInsets.all(
                    CustomSizes.mp_w_4,
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.solidBell,
                      color: CustomColors.blue,
                      size: CustomSizes.icon_size_4,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
