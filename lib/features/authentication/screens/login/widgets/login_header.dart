import 'package:e_commerce_ui_project/utils/contants/image_strings.dart';
import 'package:e_commerce_ui_project/utils/contants/sizes.dart';
import 'package:e_commerce_ui_project/utils/contants/text_strings.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),
        const SizedBox(height: TSizes.paddingSm),
        Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: TSizes.paddingSm),
        Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
