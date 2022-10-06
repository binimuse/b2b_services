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
        title: const Text('DelivredPageDistributerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DelivredPageDistributerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
