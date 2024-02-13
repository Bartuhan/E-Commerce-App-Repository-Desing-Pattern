import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          iconSize: TSizes.paddingMd,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
          iconColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // İtem Count
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Add button
        const TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          iconSize: TSizes.paddingMd,
          backgroundColor: TColors.primaryColor,
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
