import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColors.white,
      borderRadius: BorderRadius.circular(CustomSizes.radius_6),
      elevation: 4,
      shadowColor: CustomColors.black.withOpacity(0.2),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_2,
          vertical: CustomSizes.mp_w_2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///BUILD ICON CONTAINER
            buildIcon(),

            SizedBox(
              width: CustomSizes.mp_w_4,
            ),

            ///BUILD ITEM INFO
            buildItemInfo(context),
          ],
        ),
      ),
    );
  }

  Material buildIcon() {
    return Material(
      color: CustomColors.blue.withOpacity(0.05),
      borderRadius: BorderRadius.circular(CustomSizes.radius_8),
      child: Padding(
        padding: EdgeInsets.all(
          CustomSizes.mp_w_6,
        ),
        child: Icon(
          FontAwesomeIcons.layerGroup,
          size: CustomSizes.icon_size_8,
          color: CustomColors.blue,
        ),
      ),
    );
  }

  buildItemInfo(context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Order #8769",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.black,
                        fontSize: CustomSizes.font_10,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Material(
                color: CustomColors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(CustomSizes.radius_6 * 6),
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CustomSizes.mp_w_4,
                    vertical: CustomSizes.mp_v_1 / 2,
                  ),
                  child: Text(
                    "2-items",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorUtil.darken(CustomColors.blue, 0.1),
                          fontSize: CustomSizes.font_8,
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: CustomSizes.mp_v_1 / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.solidLocationPin,
                color: CustomColors.blue,
                size: CustomSizes.icon_size_4,
              ),
              SizedBox(
                width: CustomSizes.mp_w_1,
              ),
              Text(
                "5 kilo",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: CustomColors.black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: CustomSizes.mp_v_2,
          ),

          SizedBox(
            height: CustomSizes.mp_v_1 / 2,
          ),
          Row(
            children: [
              Text(
                "Items Details",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorUtil.darken(CustomColors.blue,0.2),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                "34%",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: CustomColors.blue,
                      fontSize: CustomSizes.font_8,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: CustomSizes.mp_v_1 ,
          ),
        ],
      ),
    );
  }
}
