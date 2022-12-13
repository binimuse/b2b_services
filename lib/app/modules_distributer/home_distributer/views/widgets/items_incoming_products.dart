import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/data/model/items_model.dart';
import 'package:flutter/material.dart';

class ItemIncomingProducts extends StatelessWidget {
  ItemIncomingProducts({
    this.itemsModel,
  });

  ///ADDITIONAL  PARAMS

  final ItemsModel? itemsModel;

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
                      itemsModel!.images,
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
                          itemsModel!.name,
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
                    "${itemsModel!.price} ETB",
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

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: CustomSizes.mp_v_2,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: List.generate(
                        itemsModel!.variantsModel!.length,
                        (index) {
                          return buildDetailsRow(
                            context,
                            itemsModel!.variantsModel![index],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: CustomSizes.mp_v_2,
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

  buildDetailsRow(BuildContext context, VariantsModel variModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            variModel.attributeName,
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
          variModel.attributeValue,
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
