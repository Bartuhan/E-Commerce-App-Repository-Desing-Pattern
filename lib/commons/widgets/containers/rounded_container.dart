import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.radius,
    this.margin,
    this.size,
    this.showBorder = false,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.borderColor = TColors.borderPrimary,
  });

  final double? size;
  final double? radius;
  final bool? showBorder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final Color borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius ?? TSizes.cardRadiusLg),
        border: showBorder! ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
