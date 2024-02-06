import 'package:e_commerce_ui_project/commons/widgets/texts/brand_title_text.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            textAlign: textAlign,
            maxLines: maxLines,
            color: textColor,
            brandTextSizes: brandTextSizes,
          ),
        ),
        const SizedBox(width: TSizes.paddingXs),
        const Icon(Iconsax.verify5, color: TColors.primaryColor, size: TSizes.iconXs),
      ],
    );
  }
}
