import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/views/widgets/item_incoming_shipment.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_distributer_controller.dart';

class HomeDistributerView extends StatefulWidget {
  const HomeDistributerView({Key? key}) : super(key: key);

  @override
  State<HomeDistributerView> createState() => _HomeDistributerViewState();
}

class _HomeDistributerViewState extends State<HomeDistributerView> {
  @override
  void initState() {
    ///PUT HOME PAGE CONTROLLER
    Get.lazyPut(() => HomeDistributerController());

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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
        itemBuilder: (context, index) {
          return const ItemIncomingItems();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: CustomSizes.mp_w_4,
          );
        },
        itemCount: 12,
      ),
    );
  }
}
