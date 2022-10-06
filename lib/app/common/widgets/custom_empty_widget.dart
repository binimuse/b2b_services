// ignore_for_file: depend_on_referenced_packages

import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
    required this.buttonText,
  }) : super(key: key);

  ///
  final String title;
  final IconData icon;
  final String description;
  final String buttonText;

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
          ],
        ),
      ),
    );
  }
}
