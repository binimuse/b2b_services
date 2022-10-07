
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';

class CustomNormalButtonBorder extends StatelessWidget {
  const CustomNormalButtonBorder({
    Key? key,
    required this.text,
    required this.padding,
    this.rightIcon,
    this.leftIcon,
    required this.onPressed,
    this.textStyle,
    required this.bgColor,
    required this.borderColor,
  }) : super(key: key);

  ///ADDITIONAL INFO
  final String text;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final Color bgColor;
  final Color borderColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bgColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(CustomSizes.radius_6),
              side: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: CustomSizes.mp_w_4 ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: leftIcon!,
                      ),
                    )
                  : const SizedBox(),
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
              ),
              rightIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(left: CustomSizes.mp_w_4 * 0.8),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: rightIcon!,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
