import 'dart:io';

import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:b2b_services/app/modules/home/data/model/getdriver_model.dart';
import 'package:b2b_services/app/modules/home/data/mutation/starttrip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeController extends GetxController {
  final count = 0.obs;
  late final Dropofforder dropofforder;

 
  @override
  void onInit() {
    getOrder();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void getOrder() async {
    dropofforder = Get.arguments['order'];
  }





}
