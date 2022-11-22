// ignore_for_file: must_be_immutable

import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/views/widgets/item_incoming_shipment.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_distributer_controller.dart';

class HomeDistributerView extends GetView<HomeDistributerController> {
  HomeDistributerController j = Get.put(HomeDistributerController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loadingShipmentDeatil.value != false
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
              toolbarHeight: 0.0,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                controller.fetchAll();
              },
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
                itemBuilder: (context, index) {
                  if (controller.shipModel[index].status == "SHIPPED" &&
                      controller.shipModel[index].from == "Warehouse") {
                    return ItemIncomingItems(
                      shipModel: controller.shipModel[index],
                      index: index,
                    );
                  } else {
                    return SizedBox();
                  }
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: CustomSizes.mp_w_4,
                  );
                },
                itemCount: controller.shipModel.length,
              ),
            ),
          )
        : Center(child: CircularProgressIndicator()));
  }
}
