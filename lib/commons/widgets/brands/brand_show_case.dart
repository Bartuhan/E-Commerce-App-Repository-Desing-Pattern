import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_commerce_ui_project/features/shop/screens/all_brands/brand_products.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_ui_project/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce_ui_project/commons/widgets/containers/rounded_container.dart';
import 'package:e_commerce_ui_project/features/shop/models/brand/brand_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:get/get.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    Key? key,
    required this.images,
    required this.brand,
  }) : super(key: key);

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () => Get.to(() => TBrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.paddingMd),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            // Brand with Products Count
            TBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Brand top 3 Product Images

            Row(children: images.map((image) => brandTopProductImageWidget(image, dark)).toList())
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, bool dark) {
  return Expanded(
    child: TRoundedContainer(
      size: 100,
      backgroundColor: dark ? TColors.darkGrey : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.paddingSm),
      padding: const EdgeInsets.all(TSizes.paddingMd),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, progress) => const TShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
