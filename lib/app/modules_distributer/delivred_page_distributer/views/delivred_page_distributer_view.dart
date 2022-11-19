import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules_distributer/delivred_page_distributer/views/widgets/item_delivered_item.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/controllers/home_distributer_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DelivredPageDistributerView extends StatelessWidget {
  DelivredPageDistributerView({Key? key}) : super(key: key);

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
            ? Container(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
                  itemBuilder: (context, index) {
                    if (controller.shipModel[index].status == "DELIVERED" &&
                        controller.shipModel[index].from == "Warehouse") {
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(top: CustomSizes.mp_v_2)
                            : EdgeInsets.zero,
                        child: ItemDelivredItem(
                          shipModel: controller.shipModel[index],
                          index: index,
                          onTap: () {},
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: CustomSizes.mp_w_2,
                    );
                  },
                  itemCount: controller.shipModel.length,
                ),
              )
            : Center(child: CircularProgressIndicator())));
  }
}
