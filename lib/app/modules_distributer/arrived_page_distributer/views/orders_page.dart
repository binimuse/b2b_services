import 'package:b2b_services/app/common/widgets/custom_normal_button_border.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/widgets/dialog_bottom_sheet_vehicle_type.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/widgets/item_order.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
        toolbarHeight: 0.0,
      ),
      floatingActionButton: buildFloatingActionButton(context),
      body: Container(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? EdgeInsets.only(top: CustomSizes.mp_v_2)
                  : EdgeInsets.zero,
              child: ItemOrder(
                onTap: () {},
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: CustomSizes.mp_w_2,
            );
          },
          itemCount: 12,
        ),
      ),
    );
  }

  buildFloatingActionButton(context) {
    return Wrap(
      children: [
        CustomNormalButtonBorder(
          text: "Call Delivery",
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: CustomColors.white,
                fontWeight: FontWeight.w600,
              ),
          borderColor: CustomColors.blue,
          bgColor: CustomColors.blue,
          leftIcon: Icon(
            FontAwesomeIcons.solidTruck,
            size: CustomSizes.icon_size_4,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: CustomSizes.mp_v_2,
            vertical: CustomSizes.mp_v_2,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) {
                return DialogBottomSheetVehicleType();
              },
            );
          },
        ),
      ],
    );
  }
}
