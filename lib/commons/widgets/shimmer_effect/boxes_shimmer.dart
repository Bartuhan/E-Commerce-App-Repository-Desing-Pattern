import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: TShimmerEffect(width: 150, height: 110)),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(child: TShimmerEffect(width: 150, height: 110)),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(child: TShimmerEffect(width: 150, height: 110)),
      ],
    );
  }
}
