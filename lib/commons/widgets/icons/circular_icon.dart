import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import '../../../utils/contants/index.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.iconSize = TSizes.paddingLg,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, iconSize;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? (dark ? TColors.black.withOpacity(0.9) : TColors.white.withOpacity(0.9)),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          )),
    );
  }
}
