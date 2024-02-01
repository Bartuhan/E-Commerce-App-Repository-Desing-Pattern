import 'package:e_commerce_ui_project/features/authentication/controller/onboarding_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/colors.dart';
import 'package:e_commerce_ui_project/utils/contants/sizes.dart';
import 'package:e_commerce_ui_project/utils/device/device_utils.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
