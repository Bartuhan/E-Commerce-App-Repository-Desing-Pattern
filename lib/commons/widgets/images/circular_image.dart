import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../../utils/contants/index.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width,
    this.height,
    this.padding,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double? width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding ?? TSizes.paddingSm),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? TColors.white : TColors.black),
        borderRadius: BorderRadius.circular(width!),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
