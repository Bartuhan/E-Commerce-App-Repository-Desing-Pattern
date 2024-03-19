import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';

class TProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddAndRemoveButton({
    Key? key,
    required this.quantity,
    this.add,
    required this.remove,
  }) : super(key: key);

  final int quantity;
  final VoidCallback? add;
  final VoidCallback? remove;

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
          onPressed: remove,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // İtem Count
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Add button
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          iconSize: TSizes.paddingMd,
          backgroundColor: TColors.primaryColor,
          iconColor: TColors.white,
          onPressed: add,
        ),
      ],
    );
  }
}
