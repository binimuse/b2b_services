import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class DialogOrderDetail extends StatelessWidget {
  const DialogOrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Container(
            width: 90.w,
            //constraints: BoxConstraints(maxHeight: 75.h),
            child: Material(
              borderRadius: BorderRadius.circular(CustomSizes.radius_12),
              elevation: 2,
              color: CustomColors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_6,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: CustomSizes.mp_v_4,
                    ),

                    ///BUILD HEADER
                    buildHeader(context),

                    SizedBox(
                      height: CustomSizes.mp_v_2,
                    ),

                    ///BUILD ORDER INFO
                    buildOrderInfo(context),

                    SizedBox(
                      height: CustomSizes.mp_v_4,
                    ),

                    ///BUILD BOTTOM INFO
                    buildBottomInfo(context),

                    SizedBox(
                      height: CustomSizes.mp_v_4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Material(
      color: CustomColors.lightGrey.withOpacity(0.4),
      borderRadius: BorderRadius.circular(CustomSizes.radius_12),
      child: Container(
        height: CustomSizes.icon_size_16,
        padding: EdgeInsets.all(CustomSizes.mp_w_4),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Order Id",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lightBlack),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "#123123",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomColors.blue,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildOrderInfo(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ordered Items",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomColors.blue,
              ),
        ),

        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          padding: EdgeInsets.only(left: CustomSizes.mp_w_6,top: CustomSizes.mp_v_2),
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
                color: CustomColors.lightGrey,
              ),
            );
          },
        ),
      ],
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
        Icon(FontAwesomeIcons.lightCheckDouble,size: CustomSizes.icon_size_4*0.7,color: CustomColors.green,),
        SizedBox(width: CustomSizes.mp_w_2,),
      ],
    );
  }

  buildBottomInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Accepted Date",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: CustomColors.blue,
          ),
        ),

        SizedBox(height: CustomSizes.mp_v_2,),

        Align(
          alignment: Alignment.center,
          child: Text(
            "Monday Jan 12, 2022",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: CustomSizes.font_14,
              color: CustomColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
