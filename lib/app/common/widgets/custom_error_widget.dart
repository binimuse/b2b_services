// ignore_for_file: depend_on_referenced_packages


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../modules/config/theme/custom_colors.dart';
import '../../modules/config/theme/custom_sizes.dart';
import 'custom_normal_button.dart';


class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.description,
      required this.buttonText,
      required this.onRetry})
      : super(key: key);

  ///
  final String title;
  final IconData icon;
  final String description;
  final String buttonText;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        color: CustomColors.white.withOpacity(0.9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: CustomSizes.icon_size_14,
              color: CustomColors.blue,
            ),
            SizedBox(
              height: CustomSizes.mp_v_2,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: CustomSizes.mp_v_1,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: CustomColors.grey),
            ),
            SizedBox(
              height: CustomSizes.mp_v_2,
            ),
            CustomNormalButton(
              text: buttonText,
              leftIcon: Icon(
                FontAwesomeIcons.arrowRotateRight,
                color: CustomColors.white,
                size: CustomSizes.icon_size_4,
              ),
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.white,
                    fontWeight: FontWeight.w600,
                  ),
              padding: EdgeInsets.symmetric(
                horizontal: CustomSizes.mp_w_12,
                vertical: CustomSizes.mp_v_2,
              ),
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
