import 'package:e_commerce_ui_project/commons/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_ui_project/commons/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              const TBrandShowCase(
                images: [TImages.productImage1, TImages.productImage2, TImages.productImage3],
              ),

              // Products
              TSectionHeading(title: 'You might like', showActionButton: true, onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                itemCount: 4,
                itembuilder: (context, index) => const TProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ],
    );
  }
}