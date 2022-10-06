
import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'custom_normal_button.dart';

class DialogFilter extends StatelessWidget {
  const DialogFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 90.w,
        constraints: BoxConstraints(maxHeight: 75.h),
        child: Material(
          borderRadius: BorderRadius.circular(CustomSizes.radius_6),
          elevation: 2,
          color: CustomColors.white,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
            child: Column(
              children: [
                SizedBox(
                  height: CustomSizes.mp_v_4,
                ),

                ///BUILD HEADER
                buildHeader(context),

                SizedBox(
                  height: CustomSizes.mp_v_4,
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ///BUILD FILTER CONTAINER ONE
                        buildFilterContainerOne(context),

                        SizedBox(
                          height: CustomSizes.mp_v_4,
                        ),

                        ///BUILD FILTER CONTAINER TWO
                        buildFilterContainerTwo(context),

                        SizedBox(
                          height: CustomSizes.mp_v_4,
                        ),

                        ///BUILD FILTER CONTAINER THREE
                        buildFilterContainerThree(context),

                        SizedBox(
                          height: CustomSizes.mp_v_4,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: CustomSizes.mp_v_2,
                ),

                //BUILD DONE BUTTON
                buildDoneButton(context),

                SizedBox(
                  height: CustomSizes.mp_v_2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Text(
      "Safiya oil filtering",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: CustomColors.blue,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  buildFilterContainerOne(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
        vertical: CustomSizes.mp_v_2,
      ),
      decoration: BoxDecoration(
        color: CustomColors.lightGrey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(CustomSizes.radius_6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Saturated",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: CustomSizes.mp_v_1,
          ),
          Row(
            children: [
              buildFilterIconButton(
                context,
                FontAwesomeIcons.check,
                true,
              ),
              SizedBox(
                width: CustomSizes.mp_w_4,
              ),
              buildFilterIconButton(
                context,
                FontAwesomeIcons.x,
                false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildFilterContainerTwo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
        vertical: CustomSizes.mp_v_2,
      ),
      decoration: BoxDecoration(
        color: CustomColors.lightGrey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(CustomSizes.radius_6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Size",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: CustomSizes.mp_v_1,
          ),
          Wrap(
            children: [
              buildFilterTxtButton(
                context,
                "1 Liter",
                true,
              ),
              buildFilterTxtButton(
                context,
                "2 Liter",
                false,
              ),
              buildFilterTxtButton(
                context,
                "5 Liter",
                false,
              ),
              buildFilterTxtButton(
                context,
                "10 Liter",
                false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildFilterContainerThree(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
        vertical: CustomSizes.mp_v_2,
      ),
      decoration: BoxDecoration(
        color: CustomColors.lightGrey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(CustomSizes.radius_6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Made of",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: CustomSizes.mp_v_1,
          ),
          Wrap(
            children: [
              buildFilterTxtButton(
                context,
                "Sunflower",
                true,
              ),
              buildFilterTxtButton(
                context,
                "Olive",
                false,
              ),
              buildFilterTxtButton(
                context,
                "Sesame",
                false,
              ),
              buildFilterTxtButton(
                context,
                "Flaxseed",
                false,
              ),
              buildFilterTxtButton(
                context,
                "Coconut",
                false,
              ),
              buildFilterTxtButton(
                context,
                "Hemp",
                false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFilterTxtButton(
      BuildContext context, String text, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(
        right: CustomSizes.mp_w_2,
        bottom: CustomSizes.mp_w_2,
      ),
      child: CustomButtonFeedBack(
        child: Material(
          borderRadius: BorderRadius.circular(CustomSizes.radius_4),
          color: isSelected ? CustomColors.blue : CustomColors.lightGrey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CustomSizes.mp_w_6,
              vertical: CustomSizes.mp_w_2,
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isSelected
                      ? CustomColors.white
                      : CustomColors.lightBlack),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Widget buildFilterIconButton(
      BuildContext context, IconData icon, bool isSelected) {
    return CustomButtonFeedBack(
      child: Material(
        borderRadius: BorderRadius.circular(CustomSizes.radius_4),
        color: isSelected ? CustomColors.blue : CustomColors.lightGrey,
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.mp_w_4 * 0.8),
          child: Icon(
            icon,
            color: isSelected ? CustomColors.white : CustomColors.lightBlack,
            size: CustomSizes.icon_size_4,
          ),
        ),
      ),
      onTap: () {},
    );
  }

  buildDoneButton(context) {
    return SizedBox(
      width: double.infinity,
      child: CustomNormalButton(
        text: "Done",
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CustomColors.white,
              fontSize: CustomSizes.font_12,
            ),
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_2,
          vertical: CustomSizes.mp_w_4,
        ),
        onPressed: () {},
      ),
    );
  }
}
