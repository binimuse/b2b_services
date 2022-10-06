import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/helper/keyboard.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/views/widgets/item_incoming_items.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_distributer_controller.dart';

class HomeDistributerView extends GetView<HomeDistributerController> {
  const HomeDistributerView({Key? key}) : super(key: key);
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
        children: [
          SizedBox(
            height: CustomSizes.mp_v_2,
          ),

          ///APP BAR
          buildAppBar(context),

          SizedBox(
            height: CustomSizes.mp_v_2,
          ),

          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
              child: ListView.separated(

                itemBuilder: (context, index) {
                  return  const ItemIncomingItems();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: CustomSizes.mp_w_2,);
                },
                itemCount: 12,
              ),
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
