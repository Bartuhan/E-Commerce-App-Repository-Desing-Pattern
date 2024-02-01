import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.size = 400,
    this.child,
    this.padding = EdgeInsets.zero,
    required this.backgroundColor,
  });

  final double? size;
  final EdgeInsets? padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size ?? 400),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
