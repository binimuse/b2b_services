// ignore_for_file: must_be_immutable

import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/controllers/home_distributer_controller.dart';
import 'package:b2b_services/app/modules_distributer/shipped_page_distributer/views/widgets/item_shiped_item.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shipped_page_distributer_controller.dart';

class ShippedPageDistributerView extends StatelessWidget {
  ShippedPageDistributerView({Key? key}) : super(key: key);
  HomeDistributerController controller = Get.find<HomeDistributerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
          toolbarHeight: 0.0,
        ),
        body: Obx(() => controller.loadingShipmentDeatil.value != false
            ? RefreshIndicator(
                onRefresh: () async {
                  controller.fetchAll();
                },
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
                  itemBuilder: (context, index) {
                    if (controller.shipModel[index].status == "SHIPPED" &&
                        controller.shipModel[index].from == "Distributor") {
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(top: CustomSizes.mp_v_2)
                            : EdgeInsets.zero,
                        child: ItemShipedItem(
                          shipModel: controller.shipModel[index],
                          index: index,
                          onTap: () {
                            //   Get.toNamed(Routes.ASSIGNED_ORDERS_DISTRIBUTER);
                          },
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: CustomSizes.mp_v_2,
                    );
                  },
                  itemCount: controller.shipModel.length,
                ),
              )
            : Center(
                child: Text(
                'No Shiped items.',
                textAlign: TextAlign.center,
              ))));
  }
}
