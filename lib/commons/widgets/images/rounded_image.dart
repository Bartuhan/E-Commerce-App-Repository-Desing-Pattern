import 'package:flutter/material.dart';
import '../../../utils/contants/index.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imagePath,
    this.border,
    this.fit,
    this.padding,
    this.backgroundColor = Colors.transparent,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.borderRadius = TSizes.paddingMd,
    this.onPressed,
  });

  final double? width, height;
  final String imagePath;
  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage ? NetworkImage(imagePath) : AssetImage(imagePath) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
