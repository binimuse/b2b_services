import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/scan_qr_code_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCodeView extends GetView<ScanQrCodeController> {
  const GenerateQrCodeView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            height: 50.h,
            width: 85.w,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ], borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4.w,
                ),
                QrImage(
                  data: id.toString(),
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(
                  height: 5.w,
                ),
                finishandstartbutton(context)
              ],
            )),
      ),
    );
  }

  Container finishandstartbutton(BuildContext context) {
    return Container(
      height: 15.w,
      width: 60.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.blue,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          Get.back();
          Get.back();
          Get.back();
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.grey,
          padding: EdgeInsets.symmetric(vertical: 2.3.h),
        ),
        child: Text("Done",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: CustomColors.blue,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp)),
      ),
    );
  }
}
