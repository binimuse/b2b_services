import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/views/widgets/items_incoming_products.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemIncomingItems extends StatefulWidget {
  const ItemIncomingItems({Key? key}) : super(key: key);

  @override
  State<ItemIncomingItems> createState() => _ItemIncomingItemsState();
}

class _ItemIncomingItemsState extends State<ItemIncomingItems> {
  ///
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          CustomSizes.radius_6,
        ),
        color: CustomColors.lightGrey.withOpacity(0.5),
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

              ///BUILD EXPAND COLLAPSE ICONS
              buildExpandCollapseButton(),


            ],
          ),
          SizedBox(height: CustomSizes.mp_v_2,),


          ///BUILD INCOMING PRODUCTS LIST
          isExpanded ? buildIncomingProductsList():SizedBox(),
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

  buildExpandCollapseButton() {
    return CustomButtonFeedBack(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.radius_4),
          color: CustomColors.blue.withOpacity(0.1),
        ),
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.mp_w_2),
          child: Icon(
            isExpanded
                ? FontAwesomeIcons.chevronUp
                : FontAwesomeIcons.chevronDown,
            size: CustomSizes.icon_size_4,
            color: CustomColors.blue,
          ),
        ),
      ),
    );
  }

  buildIncomingProductsList() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (index,context) {
        return ItemIncomingProducts();
      },
      separatorBuilder: (index,context) {
        return SizedBox(height: CustomSizes.mp_v_2,);
      },
      itemCount: 3,
    );
  }
}
