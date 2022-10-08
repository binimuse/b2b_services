import 'package:b2b_services/app/config/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';

class ItemAssignedDriver extends StatefulWidget {
  const ItemAssignedDriver({Key? key}) : super(key: key);

  @override
  State<ItemAssignedDriver> createState() => _ItemAssignedDriverState();
}

class _ItemAssignedDriverState extends State<ItemAssignedDriver> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          CustomSizes.radius_6,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
        color: CustomColors.white,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
        vertical: CustomSizes.mp_v_2 * 0.9,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ///BUILD IMAGE CONTAINER
              buildImageContainer(),

              SizedBox(
                width: CustomSizes.mp_w_4,
              ),

              ///BUILD ADDITIONAL INFO
              buildAditionalInfo(context),

              SizedBox(
                width: CustomSizes.mp_w_4,
              ),

              ///NUMBER OF ORDER
              buildNumberOfOrder(),
            ],
          ),
        ],
      ),
    );
  }

  buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.radius_6),
        border: Border.all(color: CustomColors.blue.withOpacity(0.3), width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CustomSizes.radius_6),
        child: Image.network(
          "https://image.shutterstock.com/image-photo/headshot-portrait-smiling-african-american-260nw-1667439898.jpg",
          width: CustomSizes.icon_size_14,
          height: CustomSizes.icon_size_14,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  buildAditionalInfo(context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Henock Amre",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomColors.lightBlack.withOpacity(0.7)),
          ),
          Row(
            children: [
              Text(
                "#b1234",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomColors.lightBlack.withOpacity(0.7),
                    ),
              ),
              SizedBox(
                width: CustomSizes.mp_w_2,
              ),
              Expanded(
                child: Text(
                  "Suzuki desire, grey Color",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500, color: CustomColors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildNumberOfOrder() {
    return   Material(
      color: CustomColors.blue.withOpacity(0.2),
      borderRadius: BorderRadius.circular(CustomSizes.radius_6 * 6),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_4,
          vertical: CustomSizes.mp_v_1 ,
        ),
        child: Text(
          "2 Orders",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorUtil.darken(CustomColors.blue, 0.1),
            fontSize: CustomSizes.font_8,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
