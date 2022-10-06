// ignore_for_file: depend_on_referenced_packages

import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:flutter/material.dart';

import 'custom_sizes.dart';
class CustomButtonStyles {
  ///style for elevated button
  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.blue,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          CustomSizes.radius_6,
        ),
      ),
    ),
  );

  ///style for text button
  static final TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: CustomColors.blue, shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          CustomSizes.radius_6,
        ),
      ),
    ),
  );
}
