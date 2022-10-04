import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scan_qr_code_controller.dart';

class ScanQrCodeView extends GetView<ScanQrCodeController> {
  const ScanQrCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScanQrCodeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ScanQrCodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
