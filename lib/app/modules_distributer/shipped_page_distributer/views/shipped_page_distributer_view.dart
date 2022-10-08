import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules_distributer/shipped_page_distributer/views/widgets/item_shiped_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shipped_page_distributer_controller.dart';

class ShippedPageDistributerView
    extends GetView<ShippedPageDistributerController> {
  const ShippedPageDistributerView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
        toolbarHeight: 0.0,
      ),
      body:
      ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
        itemBuilder: (context,index){
          return Padding(
            padding: index==0? EdgeInsets.only(top: CustomSizes.mp_v_2):EdgeInsets.zero,
            child: ItemShipedItem(onTap: () {  },),
          );
        },
        separatorBuilder: (context,index){
          return SizedBox(height: CustomSizes.mp_v_2,);
        },
        itemCount: 12,
      ),
    );
  }
}
