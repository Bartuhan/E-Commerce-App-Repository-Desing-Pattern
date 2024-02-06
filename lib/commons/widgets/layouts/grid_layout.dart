import 'package:flutter/material.dart';
import '../../../utils/contants/index.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    required this.itembuilder,
    this.mainAxixExtends = 288,
  });

  final int itemCount;
  final double? mainAxixExtends;
  final Widget? Function(BuildContext context, int index) itembuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: mainAxixExtends,
        ),
        itemBuilder: itembuilder);
  }
}
