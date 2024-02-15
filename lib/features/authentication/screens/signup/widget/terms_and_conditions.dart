import 'package:e_commerce_ui_project/features/authentication/controller/signup/signup_controller.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/contants/index.dart';

class TTermsAndConditions extends StatelessWidget {
  const TTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = value!))),
        const SizedBox(width: TSizes.spaceBtwInputFields),
        Text.rich(TextSpan(children: [
          TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: TTexts.privacyPolicy,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primaryColor,
                ),
          ),
          TextSpan(text: ' and ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: TTexts.termsOfUse,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primaryColor,
                ),
          ),
        ])),
      ],
    );
  }
}
