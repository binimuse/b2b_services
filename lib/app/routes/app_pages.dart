// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/About/bindings/about_binding.dart';
import '../modules/About/views/about_view.dart';
import '../modules/History/bindings/history_binding.dart';
import '../modules/History/views/history_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/my_profile/bindings/my_profile_binding.dart';
import '../modules/my_profile/views/my_profile_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/scan_qr_code/bindings/scan_qr_code_binding.dart';
import '../modules/scan_qr_code/views/scan_qr_code_view.dart';
import '../modules/scan_qr_for_driver/bindings/scan_qr_for_driver_binding.dart';
import '../modules/scan_qr_for_driver/views/scan_qr_for_driver_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules_distributer/arrived_page_distributer/bindings/arrived_page_distributer_binding.dart';
import '../modules_distributer/arrived_page_distributer/views/arrived_page_distributer_view.dart';
import '../modules_distributer/assigned_orders_distributer/bindings/assigned_orders_distributer_binding.dart';
import '../modules_distributer/assigned_orders_distributer/views/assigned_orders_distributer_view.dart';
import '../modules_distributer/delivred_page_distributer/bindings/delivred_page_distributer_binding.dart';
import '../modules_distributer/delivred_page_distributer/views/delivred_page_distributer_view.dart';
import '../modules_distributer/drivers_found_distributer/bindings/drivers_found_distributer_binding.dart';
import '../modules_distributer/drivers_found_distributer/views/drivers_found_distributer_view.dart';
import '../modules_distributer/home_distributer/bindings/home_distributer_binding.dart';
import '../modules_distributer/home_distributer/views/home_distributer_view.dart';
import '../modules_distributer/main_screen_distributer/bindings/main_screen_distributer_binding.dart';
import '../modules_distributer/main_screen_distributer/views/main_screen_distributer_view.dart';
import '../modules_distributer/searching_drivers_distributer/bindings/searching_drivers_distributer_binding.dart';
import '../modules_distributer/searching_drivers_distributer/views/searching_drivers_distributer_view.dart';
import '../modules_distributer/shipped_page_distributer/bindings/shipped_page_distributer_binding.dart';
import '../modules_distributer/shipped_page_distributer/views/shipped_page_distributer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR_CODE,
      page: () => ScanQrCodeView(),
      binding: ScanQrCodeBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DISTRIBUTER,
      page: () => HomeDistributerView(),
      binding: HomeDistributerBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN_DISTRIBUTER,
      page: () => const MainScreenDistributerView(),
      binding: MainScreenDistributerBinding(),
    ),
    GetPage(
      name: _Paths.ARRIVED_PAGE_DISTRIBUTER,
      page: () => const ArrivedPageDistributerView(),
      binding: ArrivedPageDistributerBinding(),
    ),
    GetPage(
      name: _Paths.SHIPPED_PAGE_DISTRIBUTER,
      page: () => ShippedPageDistributerView(),
      binding: ShippedPageDistributerBinding(),
    ),
    GetPage(
      name: _Paths.DELIVRED_PAGE_DISTRIBUTER,
      page: () => DelivredPageDistributerView(),
      binding: DelivredPageDistributerBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHING_DRIVERS_DISTRIBUTER,
      page: () => const SearchingDriversDistributerView(),
      binding: SearchingDriversDistributerBinding(),
    ),
    GetPage(
      name: _Paths.DRIVERS_FOUND_DISTRIBUTER,
      page: () => const DriversFoundDistributerView(),
      binding: DriversFoundDistributerBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNED_ORDERS_DISTRIBUTER,
      page: () => const AssignedOrdersDistributerView(),
      binding: AssignedOrdersDistributerBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR_FOR_DRIVER,
      page: () => ScanQrForDriverView(),
      binding: ScanQrForDriverBinding(),
    ),
  ];
}
