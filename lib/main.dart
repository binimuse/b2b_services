import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("FCM TEST => message $message");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FCMConfig.instance.init(
    defaultAndroidForegroundIcon:
        '@mipmap/ic_launcher', //default is @mipmap/ic_launcher
    defaultAndroidChannel: AndroidNotificationChannel(
      'high_importance_channel', // same as value from android setup
      'Fcm config',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('notification'),
    ),
    onBackgroundMessage: _firebaseMessagingBackgroundHandler,
  );

  FCMConfig.instance.messaging.getToken().then((token) {
    print("FCM TEST => TOKEN $token");
  });

  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return FCMNotificationListener(
        onNotification:
            (RemoteMessage notification, void Function() setState) {
              print("FCM TEST => notification ${notification.data.toString()}");
            },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "B2B Service",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      );
    }),
  );
}
