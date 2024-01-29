import 'package:e_commerce_ui_project/features/authentication/controller/onboarding_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/colors.dart';
import 'package:e_commerce_ui_project/utils/contants/sizes.dart';
import 'package:e_commerce_ui_project/utils/device/device_utils.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? Colors.black : TColors.primaryColor,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
