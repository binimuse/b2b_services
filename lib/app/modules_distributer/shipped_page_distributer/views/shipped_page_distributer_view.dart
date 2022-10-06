import 'package:b2b_services/app/config/utils/pages_util.dart';
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
      body: Center(
        child: Text(
          'ShippedPageDistributerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
