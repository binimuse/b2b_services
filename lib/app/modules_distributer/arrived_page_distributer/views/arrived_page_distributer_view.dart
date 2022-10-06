import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/inventory_page.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:get/get.dart';
import '../controllers/arrived_page_distributer_controller.dart';

class ArrivedPageDistributerView extends StatefulWidget {
  const ArrivedPageDistributerView({Key? key}) : super(key: key);

  @override
  State<ArrivedPageDistributerView> createState() =>
      _ArrivedPageDistributerViewState();
}

class _ArrivedPageDistributerViewState
    extends State<ArrivedPageDistributerView> {
  late final ArrivedPageDistributerController controller;

  ///
   late final tabBarValueNotifier;

  @override
  void initState() {
    ///PUT HOME PAGE CONTROLLER
    controller = Get.put(ArrivedPageDistributerController());

    ///
    tabBarValueNotifier  = ValueNotifier(controller.tabItem);

    super.initState();
  }

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: CustomSizes.mp_v_2,
          ),

          ///BUILD TAB BAR
          buildTabBar(context),

          ValueListenableBuilder<String>(
            valueListenable: tabBarValueNotifier,
            builder: (_, key, __) {
              if (key == controller.tabOrder) {
                return Expanded(
                  child: OrdersPage(),
                );
              } else {
                return Expanded(
                  child: InventoryPage(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  buildTabBar(context) {

    return Center(
      child: AdvancedSegment(
        controller: tabBarValueNotifier,
        segments: {
          controller.tabItem: 'Items',
          controller.tabOrder: 'Orders',
        },
        itemPadding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_16,
          vertical: CustomSizes.mp_v_2,
        ),
        activeStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: CustomColors.white,
              fontWeight: FontWeight.w500,
            ),
        inactiveStyle: Theme.of(context).textTheme.bodyLarge!,
        backgroundColor: CustomColors.lightGrey,
        sliderColor: CustomColors.blue,
      ),
    );
  }
}
