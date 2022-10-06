import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/modules/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../modules/config/theme/custom_colors.dart';
import 'custom_normal_button.dart';
import 'custom_normal_button_border.dart';

class DialogPayment extends StatelessWidget {
  const DialogPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 90.w,
        constraints: BoxConstraints(maxHeight: 70.h),
        child: Material(
          borderRadius: BorderRadius.circular(CustomSizes.radius_6),
          elevation: 2,
          color: CustomColors.white,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: CustomSizes.mp_v_2,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: CustomSizes.mp_v_2,
                  ),

                  ///BUILD PAYMENT TYPE
                  buildPaymentType(context),

                  SizedBox(
                    height: CustomSizes.mp_v_4,
                  ),

                  ///BUILD TERMS AND CONDITION CONTAINER
                  buildTermsContainer(context),

                  SizedBox(
                    height: CustomSizes.mp_v_2,
                  ),

                  ///BUILD PLACE ORDER BUTTON
                  //  buildPlaceOderButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery Address",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomColors.grey,
                  fontWeight: FontWeight.w300,
                ),
          ),
          TextField(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: CustomColors.lightBlack,
                  decoration: TextDecoration.none,
                ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              alignLabelWithHint: true,
              contentPadding: const EdgeInsets.all(10.0),
              prefixIcon: Icon(
                FontAwesomeIcons.solidLocationDot,
                size: CustomSizes.icon_size_6,
                color: CustomColors.blue,
              ),
              hintText: "Stadium, Kenema Pharmacy",
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.grey,
                  ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.grey),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.grey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildPaymentType(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Type",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomColors.grey,
                  fontWeight: FontWeight.w300,
                ),
          ),
          SizedBox(
            height: CustomSizes.mp_v_2,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomNormalButtonBorder(
              text: "From Wallet",
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
              borderColor: CustomColors.blue,
              bgColor: CustomColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: CustomSizes.mp_v_2,
                vertical: CustomSizes.mp_v_2 * 0.8,
              ),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => TopUpPage()));
              },
            ),
          ),
          SizedBox(
            height: CustomSizes.mp_v_2,
          ),
          Row(
            children: [
              Expanded(
                child: buildPaymentMethodType(
                  context,
                  "https://play-lh.googleusercontent.com/Mtnybz6w7FMdzdQUbc7PWN3_0iLw3t9lUkwjmAa_usFCZ60zS0Xs8o00BW31JDCkAiQk",
                  "Telebirr",
                ),
              ),
              SizedBox(
                width: CustomSizes.mp_w_2,
              ),
              Expanded(
                child: buildPaymentMethodType(
                  context,
                  "https://scontent.fadd1-1.fna.fbcdn.net/v/t39.30808-6/244338345_4392743800840894_6507268596268574098_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=qTT71UKrrToAX8TOq4M&_nc_ht=scontent.fadd1-1.fna&oh=00_AT-cHm8nJsgmtsncN186Z3vuPH9RaRJ_C2TiIoXVS4btcw&oe=634068FD",
                  "Telebirr",
                ),
              ),
              SizedBox(
                width: CustomSizes.mp_w_2,
              ),
              Expanded(
                child: buildPaymentMethodType(
                  context,
                  "https://scontent.fadd1-1.fna.fbcdn.net/v/t39.30808-6/244338345_4392743800840894_6507268596268574098_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=qTT71UKrrToAX8TOq4M&_nc_ht=scontent.fadd1-1.fna&oh=00_AT-cHm8nJsgmtsncN186Z3vuPH9RaRJ_C2TiIoXVS4btcw&oe=634068FD",
                  "Telebirr",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildTermsContainer(BuildContext context) {
    return Container(
      color: CustomColors.red.withOpacity(0.1),
      padding: EdgeInsets.symmetric(
        vertical: CustomSizes.mp_v_2,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "By Placing an order you agree to our",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: CustomColors.lightBlack,
                  fontWeight: FontWeight.w300,
                ),
          ),
          Text(
            "Terms and Condition",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: CustomColors.blue,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  buildPaymentMethodType(context, String imgAddress, String text) {
    return CustomButtonFeedBack(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: CustomSizes.mp_v_1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.radius_6),
          border: Border.all(
            color: CustomColors.red.withOpacity(0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                imgAddress,
                width: CustomSizes.icon_size_12,
                height: CustomSizes.icon_size_12,
              ),
            ),
            SizedBox(
              height: CustomSizes.mp_v_1,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: CustomColors.lightBlack,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  buildPlaceOderButton(context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
      child: CustomNormalButton(
        text: "Place Order",
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CustomColors.white,
              fontWeight: FontWeight.w600,
            ),
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_12,
          vertical: CustomSizes.mp_v_2,
        ),
        onPressed: () {},
      ),
    );
  }
}
