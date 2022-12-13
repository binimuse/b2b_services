import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/modules/home/data/model/getdriver_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/scan_qr_code_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQrCodeView extends GetView<ScanQrCodeController> {
  const ScanQrCodeView({
    Key? key,
    this.dropofforder,
  }) : super(key: key);

  final Dropofforder? dropofforder;
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
                  data:
                      "dropOffid = ${controller.dropofforder.dropOffid}, orderId = ${controller.dropofforder.orderId}",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(
                  height: 4.w,
                ),
                Container(
                  width: Get.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('order id',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 14.sp)),
                      SizedBox(
                        width: 15.w,
                      ),
                      controller.dropofforder.orderId.isNotEmpty
                          ? Text(controller.dropofforder.orderId,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 14.sp))
                          : SizedBox()
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  indent: 12.w,
                  endIndent: 12.w,
                ),
                Container(
                  width: Get.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('drop off id',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 14.sp)),
                      SizedBox(
                        width: 15.w,
                      ),
                      controller.dropofforder.dropOffid.isNotEmpty
                          ? Text(controller.dropofforder.dropOffid,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 14.sp))
                          : SizedBox()
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  indent: 12.w,
                  endIndent: 12.w,
                ),
                Container(
                  width: Get.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('total Price',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 14.sp)),
                      SizedBox(
                        width: 15.w,
                      ),
                      controller.dropofforder.totalPrice.isNotEmpty
                          ? Text(controller.dropofforder.totalPrice,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 14.sp))
                          : SizedBox()
                    ],
                  ),
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
