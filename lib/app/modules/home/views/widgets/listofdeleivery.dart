// ignore_for_file: invalid_use_of_protected_member

import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules/home/views/widgets/item_order2.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/widgets/item_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/home_controller.dart';

class ListOfDeleivery extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
          toolbarHeight: 0.0,
        ),
        body: Obx(() => controller.getDropOffss.value == true
            ? RefreshIndicator(
                onRefresh: () async {},
                child: Container(
                  child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(top: CustomSizes.mp_v_2)
                            : EdgeInsets.zero,
                        child: ItemOrder2(
                          orderHistory: controller.dropOffOrder[index],
                          index: index,
                          onTap: () {
                     
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: CustomSizes.mp_w_2,
                      );
                    },
                    itemCount: controller.dropOffOrder.length,
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator())));
  }
}
