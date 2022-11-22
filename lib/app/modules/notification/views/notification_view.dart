import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/helper/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../config/theme/custom_sizes.dart';
import '../../../config/utils/pages_util.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
          leading: Padding(
            padding: EdgeInsets.all(CustomSizes.mp_w_2),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(CustomSizes.radius_6),
              child: CustomButtonFeedBack(
                onTap: () {
                  Get.back();
                  KeyboardUtil.hideKeyboard(context);
                },
                child: Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: CustomColors.blue,
                  size: CustomSizes.icon_size_4,
                ),
              ),
            ),
          ),
          title: Text(
            'Notification',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 15),
            color: Colors.white,
            child: ListView.builder(
              itemCount: controller.getNotification.length,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) {
                return _createItem(
                    context: context,
                    notifDate: controller.getNotification[index].created_at,
                    notifTitle: controller.getNotification[index].title,
                    notifMessage: controller.getNotification[index].body);
              },
            ),
          ),
        ));
  }

  Widget _createItem(
      {required String notifDate,
      required String notifTitle,
      required String notifMessage,
      StatefulWidget? page,
      required BuildContext context}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (page != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notifTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.blue)),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(notifDate,
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 11)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(notifMessage,
                        style: const TextStyle(color: CustomColors.grey)),
                  ],
                )),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
