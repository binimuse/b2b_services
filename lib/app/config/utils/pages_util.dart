
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PagesUtil {
  static getAppBarLightStyle() {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    );
  }

}
