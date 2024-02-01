import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/device/device_utils.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.textStyle,
    this.showBorder = true,
    this.showBackGround = true,
    this.icon = Iconsax.search_normal,
  });

  final String text;
  final TextStyle? textStyle;
  final IconData? icon;
  final bool showBackGround, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(),
        padding: const EdgeInsets.all(TSizes.paddingMd),
        decoration: BoxDecoration(
          color: showBackGround
              ? dark
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: Border.all(
              color: showBorder
                  ? dark
                      ? TColors.dark
                      : TColors.light
                  : Colors.transparent),
        ),
        child: Row(
          children: [
            Icon(icon, color: TColors.darkGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(text, style: textStyle ?? Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
