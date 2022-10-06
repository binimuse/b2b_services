import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'custom_normal_button.dart';

class WarningDialog extends StatelessWidget {
  WarningDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.onLeftButtonTap,
      required this.onRightButtonTap,
      required this.leftButtonText,
      required this.rightButtonText})
      : super(key: key);

  ///ADDITIONAL PARAMETERS
  final String title;
  final String description;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback onLeftButtonTap;
  final VoidCallback onRightButtonTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Wrap(
          children: [
            Container(
              width: 85.w,
              padding: EdgeInsets.symmetric(
                horizontal: CustomSizes.mp_w_4,
                vertical: CustomSizes.mp_v_2,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  CustomSizes.radius_6,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: CustomSizes.mp_v_1,
                  ),

                  ///HEADER TEXTS
                  buildDialogHeader(context),

                  SizedBox(
                    height: CustomSizes.mp_v_4,
                  ),

                  ///DIALOG CONFORMATION BUTTONS
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CustomSizes.mp_w_2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///LEFT NEGATIVE BUTTON
                        buildLeftButton(context),

                        ///RIGHT POSITIVE BUTTON
                        buildRightButton(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildDialogHeader(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: CustomSizes.mp_v_2,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: CustomSizes.font_10,
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  buildLeftButton(context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text(
          leftButtonText,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: CustomColors.blue,
              ),
        ),
        onPressed: onLeftButtonTap,
      ),
    );
  }

  buildRightButton(context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CustomNormalButton(
        text: rightButtonText,
        textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Colors.white,
            ),
        padding: EdgeInsets.symmetric(
          vertical: CustomSizes.mp_v_1,
          horizontal: CustomSizes.mp_w_4,
        ),
        onPressed: onRightButtonTap,
      ),
    );
  }
}
