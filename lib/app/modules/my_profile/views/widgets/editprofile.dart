// ignore_for_file: deprecated_member_use, unnecessary_null_comparison, must_be_immutable

import 'dart:io';

import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/constant/cache_image_network.dart';
import 'package:b2b_services/app/constant/global_style.dart';
import 'package:b2b_services/app/modules/my_profile/controllers/my_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sizer/sizer.dart';

import '../../../../constant/constants.dart';

class EditProfilePage extends GetView<MyProfileController> {
  EditProfilePage({Key? key}) : super(key: key);
  @override
  MyProfileController controller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: const Text(
            'Edit Profile',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: controller.reusableWidget.bottomAppBar(),
        ),
        body: Form(
          key: controller.editprofilekey2,
          autovalidateMode: AutovalidateMode.disabled,
          child: Obx(() => controller.loadingUserID.isTrue
              ? Container(
                  padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Obx(
                            () => controller.selectedImagePath.value != ''
                                ? Stack(
                                    fit: StackFit.passthrough,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    children: [
                                        CircleAvatar(
                                          radius: 20.w,
                                          child: ClipOval(
                                              child: Image.file(
                                            File(
                                              controller
                                                  .selectedImagePath.value,
                                            ),
                                            width: 300,
                                          )),
                                        ),
                                        Positioned(
                                          left: 20.w,
                                          top: 30.w,
                                          child: MaterialButton(
                                            color: Colors.white,
                                            shape: const CircleBorder(),
                                            elevation: 2,
                                            child: const Icon(
                                              Icons.edit,
                                              color: CustomColors.blue,
                                            ),
                                            onPressed: () {
                                              _showPicker(context);
                                            },
                                          ),
                                        )
                                      ])
                                : Stack(
                                    fit: StackFit.passthrough,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    children: [
                                        controller.profilepic.value == null
                                            ? CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: Get.width / 6.5,
                                                child: buildCacheNetworkImage(
                                                    url: '$GLOBAL_URL/assets/images/user/avatar.png',
                                                    width: 300),
                                              )
                                            : CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: Get.width / 6.5,
                                                child: buildCacheNetworkImage(
                                                    url: controller
                                                        .profilepic.value,
                                                    width: 300),
                                              ),
                                        Positioned(
                                          left: 15.w,
                                          top: 20.w,
                                          child: MaterialButton(
                                            color: Colors.white,
                                            shape: const CircleBorder(),
                                            elevation: 2,
                                            child: const Icon(
                                              Icons.edit,
                                              color: CustomColors.blue,
                                            ),
                                            onPressed: () {
                                              _showPicker(context);
                                            },
                                          ),
                                        )
                                      ]),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.8.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.name,
                                      validator: (value) {
                                        return controller.validateName(value!);
                                      },
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: controller.getUser[0].name,
                                        hintStyle: TextStyle(
                                          color: const Color(0xff757A80),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        alignLabelWithHint: true,
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: CustomColors.blue
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: CustomColors.blue,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.w,
                                          horizontal: 2.7.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.8.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Phone",
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: controller.phone,
                                      validator: (value) {
                                        return controller.validatePhone(value!);
                                      },
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                      ),
                                      decoration: InputDecoration(
                                        hintText:
                                            controller.getUser[0].contact_phone,
                                        hintStyle: TextStyle(
                                          color: const Color(0xff757A80),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        alignLabelWithHint: true,
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: CustomColors.blue
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: CustomColors.blue,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.w,
                                          horizontal: 2.7.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.8.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.address,
                                      validator: (value) {
                                        return controller
                                            .validateaddeaa(value!);
                                      },
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: controller.getUser[0].address,
                                        hintStyle: TextStyle(
                                          color: const Color(0xff757A80),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        alignLabelWithHint: true,
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: CustomColors.blue
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: CustomColors.blue,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.w,
                                          horizontal: 2.7.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                controller.checka();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.blue,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                              ),
                              child: Text('SAVE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator())),
        ));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                      color: CustomColors.blue,
                    ),
                    title: const Text(
                      'Photo Library',
                    ),
                    onTap: () {
                      controller.getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                      _showAlertDialog(context);
                    }),
                ListTile(
                  leading: const Icon(
                    Icons.photo_camera,
                    color: CustomColors.blue,
                  ),
                  title: const Text('Camera'),
                  onTap: () {
                    controller.getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  void _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('No', style: TextStyle(color: CustomColors.blue)));
    Widget continueButton = TextButton(
        onPressed: () {
          //  controller.updateonlyprofilepic();
          Navigator.pop(context);
        },
        child: const Text('Yes', style: TextStyle(color: CustomColors.blue)));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text('Change Profile Picture ?'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
