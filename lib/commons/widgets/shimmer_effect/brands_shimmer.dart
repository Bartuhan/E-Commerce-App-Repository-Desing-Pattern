import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_ui_project/commons/widgets/layouts/grid_layout.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({
    Key? key,
    this.itemCount = 4,
  }) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxixExtends: 80,
      itemCount: itemCount,
      itembuilder: (context, index) => const TShimmerEffect(width: 300, height: 80),
    );
  }
}
