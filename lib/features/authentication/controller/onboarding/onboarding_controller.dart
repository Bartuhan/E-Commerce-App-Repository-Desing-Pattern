import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce_ui_project/data/services/local_storage/db_manager.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///Veriables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current index & jump tp next page.
  void nextPage() {
    if (currentPageIndex.value == 2) {
      DbManager.add('isFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current index & jump to last page.
  void skipPage() {
    DbManager.add('isFirstTime', false);
    Get.offAll(const LoginScreen());
  }
}
