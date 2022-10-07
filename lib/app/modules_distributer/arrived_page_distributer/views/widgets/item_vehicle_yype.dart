import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/color_util.dart';
import 'package:flutter/material.dart';

class ItemVehicleType extends StatefulWidget {
  const ItemVehicleType(
      {Key? key,
      required this.icon,
      required this.typeName,
      required this.typeDesc})
      : super(key: key);

  final IconData icon;
  final String typeName;
  final String typeDesc;

  @override
  State<ItemVehicleType> createState() => _ItemVehicleTypeState();
}

class _ItemVehicleTypeState extends State<ItemVehicleType> {

  ///
   bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CustomButtonFeedBack(
      onTap: () {
        setState(() {
          isSelected=!isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected?CustomColors.blue:CustomColors.white,
          borderRadius: BorderRadius.circular(CustomSizes.radius_12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_4,
          vertical: CustomSizes.mp_v_4*0.6,
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: CustomSizes.icon_size_10,
              color:isSelected?CustomColors.white: CustomColors.blue,
            ),
            SizedBox(
              width: CustomSizes.mp_w_8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.typeName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected?CustomColors.white:CustomColors.blue,
                        fontWeight: FontWeight.w500,
                    fontSize: CustomSizes.font_12,
                      ),
                ),
                SizedBox(
                  height: CustomSizes.mp_v_1,
                ),
                Text(
                  widget.typeDesc,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isSelected?CustomColors.lightGrey:CustomColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
