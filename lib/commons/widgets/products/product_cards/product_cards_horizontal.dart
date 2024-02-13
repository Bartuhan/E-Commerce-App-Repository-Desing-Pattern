import 'package:e_commerce_ui_project/commons/widgets/containers/rounded_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/price_text.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/product_title.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          // Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.paddingSm),
            backgroundColor: dark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: TRoundedImage(imagePath: TImages.productImage1, applyImageRadius: true),
                ),
                // Sale Tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.paddingSm,
                    backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSm, vertical: TSizes.paddingXs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                ),

                //Favorite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          // Details

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: TSizes.paddingSm, left: TSizes.paddingSm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Green Nike Half Sleeves Shirt', smallSize: true),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Pricing
                      Flexible(child: TProductPriceText(price: '256.0')),

                      // Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
