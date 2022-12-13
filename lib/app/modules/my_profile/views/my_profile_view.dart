// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:b2b_services/app/constant/constants.dart';
import 'package:b2b_services/app/constant/global_style.dart';
import 'package:b2b_services/app/modules/my_profile/views/widgets/editprofile.dart';
import 'package:b2b_services/app/modules/my_profile/views/widgets/profile_menu.dart';
import 'package:b2b_services/app/modules/my_profile/views/widgets/setting.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  MyProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: GlobalStyle.appBarIconThemeColor,
        ),
        systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
        centerTitle: true,
        title: const Text('Profile', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: FontAwesomeIcons.user,
              press: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage())),
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: FontAwesomeIcons.bell,
              press: () {
                Get.toNamed(Routes.NOTIFICATION);
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: FontAwesomeIcons.gear,
              press: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsFourPage())),
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: FontAwesomeIcons.briefcase,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: FontAwesomeIcons.signOut,
              press: () async {
                Get.dialog(AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: const Text(
                    'Warning, Logging Out',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  content: const Text('Are you sure you want to log out ?',
                      style: TextStyle(fontSize: 13, color: Colors.black)),
                  actions: [
                    cancelButton,
                    continueButton,
                  ],
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cancelButton = TextButton(
      onPressed: () {
        // Navigator.pop();
        Get.back();
      },
      child: const Text('No', style: TextStyle(color: SOFT_BLUE)));

  Widget continueButton = TextButton(
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();

        final acc = await prefs.remove('access_token');
        final role = await prefs.remove('role');

        if (acc && role) {
          Get.offAllNamed(Routes.SIGN_IN);
        }
        // Navigator.pop(context);
      },
      child: const Text('Yes', style: TextStyle(color: SOFT_BLUE)));
}
