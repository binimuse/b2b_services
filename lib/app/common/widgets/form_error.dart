
import 'package:b2b_services/app/modules/config/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../modules/constant/size_config.dart';



class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length,
            (index) => Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Error.svg",
                      height: getProportionateScreenWidth(14),
                      width: getProportionateScreenWidth(14),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      errors[index].toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: CustomColors.red, fontWeight: FontWeight.w500),
                    ),
                  ],
                )));
  }
}
