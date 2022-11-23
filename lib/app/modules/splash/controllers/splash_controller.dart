// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:b2b_services/app/routes/app_pages.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/muation.dart';

class SplashController extends GetxController {
  var acc;
  var role;
  final count = 0.obs;

  void checkIfLogin() async {
    final prefs = await SharedPreferences.getInstance();

    acc = prefs.getString('access_token');
    role = prefs.getString('role');

    if (acc != null && role == "distributor") {
      Get.toNamed(Routes.MAIN_SCREEN_DISTRIBUTER);
      syncFcmToken();
    } else if (acc != null && role == "driver") {
      Get.toNamed(Routes.HOME);
      syncFcmToken();
    } else {
      Get.toNamed(Routes.SIGN_IN);
      //  Get.toNamed(Routes.HOME);
    }
  }

  Future<void> syncFcmToken() async {
    final prefs = await SharedPreferences.getInstance();

    String? fcmToken = await FirebaseMessaging.instance.getToken();

    print("fcmToken ${fcmToken.toString()}");

    if (fcmToken != null) {
      GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

      GraphQLClient client = graphQLConfiguration.clientToQuery();
      QueryResult result = await client.query(
        QueryOptions(
          document: gql(
            UpdateTokenMutation.updateToken,
          ),
          variables: <String, dynamic>{
            'token': fcmToken,
          },
        ),
      );

      if (!result.hasException) {
        print("haha ${result.data}");
      } else {}
    } else {}
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
