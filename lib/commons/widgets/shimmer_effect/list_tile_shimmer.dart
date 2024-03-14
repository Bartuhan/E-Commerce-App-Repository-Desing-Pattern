import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItems),
                TShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
