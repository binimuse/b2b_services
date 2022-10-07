import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/widgets/item_order.dart';
import 'package:b2b_services/app/modules_distributer/delivred_page_distributer/views/widgets/item_delivered_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivred_page_distributer_controller.dart';

class DelivredPageDistributerView
    extends GetView<DelivredPageDistributerController> {
  const DelivredPageDistributerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
        toolbarHeight: 0.0,
      ),
      body: Container(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 00
                  ? EdgeInsets.only(top: CustomSizes.mp_v_2)
                  : EdgeInsets.zero,
              child: ItemDelivredItem(
                onTap: () {},
              ),
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
    );
  }
}
