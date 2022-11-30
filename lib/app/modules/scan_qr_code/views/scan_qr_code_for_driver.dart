// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/scan_qr_code_controller.dart';

class ScanQRCodepageForDriver extends GetView<ScanQrCodeController> {
  @override
  ScanQrCodeController controller = Get.put(ScanQrCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: controller.buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Obx(() => controller.data.value.isNotEmpty
                      ? Text('Data: ${controller.data.value.toString()}')
                      : const Text('Scan a code',
                          style: TextStyle(fontSize: 10))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller.controllers?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 10)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              controller.data.value = "";
                              await controller.controllers?.resumeCamera();
                            },
                            child: const Text('start',
                                style: TextStyle(fontSize: 10)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Obx(() => controller.data.value.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: ElevatedButton(
                              onPressed: () async {
                                controller.startTrip();
                              },
                              child: const Text('Done',
                                  style: TextStyle(fontSize: 10)),
                            ),
                          ),
                        )
                      : const SizedBox())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
