import 'package:b2b_services/app/common/widgets/custom_normal_button.dart';
import 'package:b2b_services/app/common/widgets/custom_normal_button_border.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/color_util.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/widgets/item_vehicle_yype.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/controllers/home_distributer_controller.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class DialogBottomSheetVehicleType extends StatelessWidget {
  HomeDistributerController contoller = Get.find<HomeDistributerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.radius_12 * 2.5),
          topRight: Radius.circular(CustomSizes.radius_12 * 2.5),
        ),
      ),
      padding: EdgeInsets.only(
        left: CustomSizes.mp_w_6,
        right: CustomSizes.mp_w_6,
        top: CustomSizes.mp_v_4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Vehicle Type",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: CustomColors.black,
                  fontSize: CustomSizes.font_14,
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(
            height: CustomSizes.mp_v_2,
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contoller.vehicleModel.length,
                  itemBuilder: (context, index) {
                    return Obx(() => contoller.loadindvehicleType.isTrue
                        ? ItemVehicleType(
                            typeDesc: contoller.vehicleModel[index].title,
                            icon: contoller.vehicleModel[index].image,
                            typeName: contoller.vehicleModel[index].title,
                            isSelected:
                                contoller.selectedCarIndex.value == index,
                            onTap: () {
                              contoller.selectedCarIndex.value = index;

                              if (contoller.selectedCarIndex.value != 1000) {
                                contoller.vehicleID.value =
                                    contoller.vehicleModel[index].id;
                              } else {
                                contoller.vehicleID = ''.obs;
                              }
                            },
                          )
                        : SizedBox());
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: CustomColors.blue,
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: CustomSizes.mp_v_2),
                    child: Material(
                      elevation: 4,
                      shadowColor: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(CustomSizes.radius_6),
                      child: CustomNormalButtonBorder(
                        text: "Select Vehicle",
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: CustomColors.white,
                                  fontSize: CustomSizes.font_12,
                                  fontWeight: FontWeight.w500,
                                ),
                        bgColor: CustomColors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: CustomSizes.mp_w_2,
                          vertical: CustomSizes.mp_w_4,
                        ),
                        onPressed: () {
                          print("orderData ${contoller.orderId}");
                          print("vehicleID ${contoller.vehicleID}");
                          print("userId ${contoller.userId}");

                          if (contoller.selectedCarIndex.value != 1000 &&
                              contoller.orderId.isNotEmpty) {
                            contoller.createDropoff();
                          } else {
                            Get.dialog(AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: const Text(
                                'Warning',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              ),
                              content: const Text(
                                  'Please Select Order or Vehicle',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black)),
                            ));
                          }

                          //  Get.toNamed(Routes.SEARCHING_DRIVERS_DISTRIBUTER);
                        },
                        borderColor: CustomColors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
