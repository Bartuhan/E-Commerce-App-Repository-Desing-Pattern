import 'package:e_commerce_ui_project/features/shop/controller/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_commerce_ui_project/commons/widgets/containers/rounded_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/price_text.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/product_title.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/contants/shadow_styles.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            TRoundedContainer(
              size: 180,
              padding: const EdgeInsets.all(TSizes.paddingSm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  TRoundedImage(imagePath: product.thumbnail, isNetworkImage: true),

                  // Sale Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSizes.paddingSm,
                        backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSm, vertical: TSizes.paddingXs),
                        child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
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
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            // Details
            Padding(
              padding: EdgeInsets.only(left: TSizes.paddingSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallSize: true),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),
            const Spacer(),
            // Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price Text
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.all(TSizes.paddingSm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(left: TSizes.paddingSm),
                        child: TProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                // Add to Cart button
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
    );
  }
}
