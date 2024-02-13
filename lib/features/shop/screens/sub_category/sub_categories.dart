import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/product_cards/product_cards_horizontal.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports shirts')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // Banner
            const TRoundedImage(width: double.infinity, imagePath: TImages.promoBanner3, applyImageRadius: true),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Sub-Categories
            Column(
              children: [
                // Heading
                TSectionHeading(title: 'Sports shirts', showActionButton: true, onPressed: () {}),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                    itemBuilder: (context, index) => const TProductCardHorizontal(),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
