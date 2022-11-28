import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/app_assets.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/helper/keyboard.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../controllers/searching_drivers_distributer_controller.dart';

class SearchingDriversDistributerView
    extends GetView<SearchingDriversDistributerController> {
  const SearchingDriversDistributerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
        toolbarHeight: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///BUILD APP BAR
          buildAppBar(context),

          ///BUILD SEARCHING CONTAINER
          buildSearchingContainer(),

          ///BUILD FOOTER
          buildFotter(context),
        ],
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
            'Searching',
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

  buildSearchingContainer() {
    return Container(
      child: Container(
        height: 60.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Lottie.asset(AppAssets.pulseLottie),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: CustomSizes.icon_size_32 * 2.5,
                height: CustomSizes.icon_size_32 * 2.5,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: CustomSizes.icon_size_32 * 2.5,
                        height: CustomSizes.icon_size_32 * 2.5,
                        decoration: BoxDecoration(
                          color: CustomColors.lightGrey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: CustomSizes.icon_size_32 * 1.2,
                        height: CustomSizes.icon_size_32 * 1.2,
                        decoration: BoxDecoration(
                          color: CustomColors.blue,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Lottie.asset(AppAssets.pulseLottie),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        FontAwesomeIcons.solidTruckFast,
                        color: CustomColors.white,
                        size: CustomSizes.icon_size_12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildFotter(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Searching Nearby For drivers',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: CustomColors.blue,
                fontSize: CustomSizes.font_14,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: CustomSizes.mp_v_1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_16),
          child: Text(
            'Please wait a minute for the drivers to accept your request',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomColors.grey,
                  fontSize: CustomSizes.font_10,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        SizedBox(
          height: CustomSizes.mp_v_8,
        ),
      ],
    );
  }
}
