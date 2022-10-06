// ignore_for_file: depend_on_referenced_packages


import 'package:b2b_services/app/modules/config/theme/custom_colors.dart';
import 'package:flutter/material.dart';

import '../../modules/config/theme/custom_sizes.dart';



class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.white.withOpacity(0.9),
      child: Center(
        child: SizedBox(
          width: CustomSizes.mp_w_12,
          height: CustomSizes.mp_w_12,
          child: const CircularProgressIndicator(
            color: CustomColors.blue,
            strokeWidth: 2.5,
          ),
        ),
      ),
    );
  }
}
