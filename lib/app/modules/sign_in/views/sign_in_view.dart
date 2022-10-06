import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/common/widgets/form_error.dart';
import 'package:b2b_services/app/config/theme/app_assets.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/pages_util.dart';
import 'package:b2b_services/app/constant/constants.dart';
import 'package:b2b_services/app/helper/keyboard.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common/widgets/custom_normal_button.dart';
import '../controllers/sign_in_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///ACT HEADER
              buildActHeader(context),

              ///BUILD DECORATIVE IMAGE
              buildImage(),

              ///BUILD SIGN IN INPUTS
              buildSignInInputs(context),

              ///BUILD SIGN IN BUTTON
              buildSignInButton(context),

              SizedBox(
                height: CustomSizes.mp_v_6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Image buildImage() {
    return Image.asset(
      AppAssets.anniversary,
      width: double.infinity,
      height: 35.h,
      fit: BoxFit.contain,
    );
  }

  Text buildActHeader(BuildContext context) {
    return Text(
      "ACT",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: CustomColors.blue, fontWeight: FontWeight.w600),
    );
  }

  buildSignInInputs(context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.loginFormKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_6),
        child: Column(
          children: [
            Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomColors.blue, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: CustomSizes.mp_v_4 / 2,
            ),
            Obx(
              () => controller.loading.value != true
                  ? const Center(child: CircularProgressIndicator())
                  : TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      textInputAction: TextInputAction.next,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (newValue) => controller.email = newValue,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.removeError(error: kEmailNullError);
                        }
                        return null;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          controller.addError(error: kEmailNullError);
                          return "";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidUser,
                          color: CustomColors.grey,
                          size: CustomSizes.icon_size_4,
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: CustomSizes.mp_v_4 / 2,
            ),
            Obx(
              () => controller.loading.value != true
                  ? const Center(child: CircularProgressIndicator())
                  : TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      textInputAction: TextInputAction.next,
                      controller: controller.passwordController,
                      obscureText: true,
                      onSaved: (newValue) => controller.password = newValue,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.removeError(error: kPassNullError);
                        }
                        return null;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          controller.addError(error: kPassNullError);
                          return "";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidKey,
                          color: CustomColors.grey,
                          size: CustomSizes.icon_size_4,
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: CustomSizes.mp_v_4 / 2,
            ),
            Obx(() => controller.loading.value != true
                ? const Center(child: CircularProgressIndicator())
                : FormError(errors: controller.errors.value)),

            ///BUILD Forgot PAssword
            //   buildForgotPassword(context),
          ],
        ),
      ),
    );
  }

  buildSignInButton(context) {
    return Obx(() => controller.loading.value != true
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: CustomSizes.mp_w_6,
                  right: CustomSizes.mp_w_6,
                  top: CustomSizes.mp_w_10,
                  bottom: CustomSizes.mp_w_6,
                ),
                child: CustomNormalButton(
                  text: "Sign In",
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.white,
                      ),
                  bgColor: CustomColors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: CustomSizes.mp_v_2,
                    vertical: CustomSizes.mp_v_2 * 0.8,
                  ),
                  onPressed: () {
                    if (controller.loginFormKey.currentState!.validate()) {
                      controller.loginFormKey.currentState!.save();
                      // if all are valid then go to success screen
                      KeyboardUtil.hideKeyboard(context);
                      controller.signIn();
                    }
                  },
                ),
              ),
              CustomButtonFeedBack(
                onTap: () {
                  Get.toNamed(Routes.SIGN_UP);
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account?",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: CustomColors.lightBlack,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomColors.blue,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ));
  }

  buildForgotPassword(context) {
    return Row(
      children: [
        SizedBox(
          height: CustomSizes.mp_v_4 / 2,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
          child: Text(
            "Forgot Password",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: CustomColors.blue, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
