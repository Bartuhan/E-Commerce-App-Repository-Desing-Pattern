import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.size = 400,
    this.child,
    this.margin,
    this.isLined = false,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
  });

  final double? size;
  final bool? isLined;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: isLined! ? 4 : size,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size ?? 400),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
