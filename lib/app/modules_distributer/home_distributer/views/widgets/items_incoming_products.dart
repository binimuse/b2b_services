import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemIncomingProducts extends StatelessWidget {
  const ItemIncomingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        elevation: 4,
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(
          CustomSizes.radius_10,
        ),
        shadowColor: CustomColors.black.withOpacity(0.4),
        child: Padding(
          padding: EdgeInsets.only(
            left: CustomSizes.mp_w_4,
            top: CustomSizes.mp_w_4,
            right: CustomSizes.mp_w_4,
            bottom: CustomSizes.mp_w_4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///HEADER
              Row(

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(CustomSizes.radius_6),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShc2SV-UuHW3Ig4N36spMVj0h6KLa2GkSpLfKjG4FKqA&s",
                      width: CustomSizes.mp_w_14,
                      height: CustomSizes.mp_w_14,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: CustomSizes.mp_w_4,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Safya Oil",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: CustomSizes.font_10,
                                    color: CustomColors.lightBlack,
                                  ),
                        ),
                        Text(
                          "2 variants",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "1 Pcs",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.blue,
                        ),
                  ),
                ],
              ),

              SizedBox(
                height: CustomSizes.mp_v_2,
              ),

              Text(
                "Details",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomColors.blue,
                    ),
              ),

              SizedBox(
                height: CustomSizes.mp_v_2,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return buildDetailsRow(context);
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: CustomSizes.mp_v_1,
                        ),
                        child: const Divider(
                          height: 1,
                          color: CustomColors.grey,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: CustomSizes.mp_v_1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material buildTrackIcon(IconData icon, Color color) {
    return Material(
      borderRadius: BorderRadius.circular(
        CustomSizes.radius_6,
      ),
      color: color.withOpacity(0.2),
      child: SizedBox(
        width: CustomSizes.icon_size_12,
        height: CustomSizes.icon_size_12,
        child: Center(
          child: Icon(
            icon,
            size: CustomSizes.icon_size_4,
            color: color,
          ),
        ),
      ),
    );
  }

  buildDetailsRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "variModel.attributename",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: CustomSizes.font_8,
                ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Text(
          "5l",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomColors.grey,
                fontSize: CustomSizes.font_10,
              ),
        ),
      ],
    );
  }
}
