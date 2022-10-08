import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/helper/keyboard.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/widgets/item_order.dart';
import 'package:b2b_services/app/modules_distributer/assigned_orders_distributer/views/widgets/item_assigned_driver.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/assigned_orders_distributer_controller.dart';

class AssignedOrdersDistributerView
    extends GetView<AssignedOrdersDistributerController> {
  const AssignedOrdersDistributerView({Key? key}) : super(key: key);
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

          SizedBox(height: CustomSizes.mp_v_2,),

          ///ASSIGNED DRIVER VIEW
          Padding(
            padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
            child: ItemAssignedDriver(),
          ),


          ///DIVIDER LINE
          Padding(
            padding: EdgeInsets.symmetric(vertical: CustomSizes.mp_v_2),
            child: Divider(
              thickness: CustomSizes.icon_size_4 * 0.7,
              color: CustomColors.lightGrey.withOpacity(0.6),
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
              itemBuilder: (context, index) {
                return ItemOrder(
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: CustomSizes.mp_w_2,
                );
              },
              itemCount: 12,
            ),
          ),
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
            'Assigned Orders',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: EdgeInsets.all(CustomSizes.mp_w_2),
            child: Material(
              elevation: 4,
              color: CustomColors.white,
              borderRadius: BorderRadius.circular(CustomSizes.radius_6),
              child: CustomButtonFeedBack(
                onTap: () {},
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
