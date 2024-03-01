import 'package:e_commerce_ui_project/commons/widgets/images/circular_image.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../../utils/contants/index.dart';

class TVerticalImage extends StatelessWidget {
  const TVerticalImage({
    super.key,
    required this.image,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.onPress,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              width: 56,
              height: 56,
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.paddingSm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? TColors.light : TColors.dark,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor ?? (dark ? TColors.dark : TColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
