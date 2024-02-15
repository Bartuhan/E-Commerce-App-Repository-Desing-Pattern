import 'package:e_commerce_ui_project/data/services/local_storage/db_manager.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();

  // Called from main.dart
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to Show Relevant Screen
  screenRedirect() async {
    DbManager.addIfNull('isFirstTime', true);
    DbManager.read('isFirstTime') != true // Check First Time ?
        ? Get.offAll(const LoginScreen())
        : Get.offAll(const OnboardingScreen());
  }

/* ----------------------- Email And Password Screen ------------------------ */
}
