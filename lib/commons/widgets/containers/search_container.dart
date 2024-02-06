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
    this.ontap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
  });

  final String text;
  final TextStyle? textStyle;
  final IconData? icon;
  final bool showBackGround, showBorder;
  final EdgeInsetsGeometry padding;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: padding,
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
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: TColors.darkGrey),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(text, style: textStyle ?? Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
