import 'package:e_commerce_ui_project/features/authentication/controller/onboarding_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/sizes.dart';
import 'package:e_commerce_ui_project/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppbarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
