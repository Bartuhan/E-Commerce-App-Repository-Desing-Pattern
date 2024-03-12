import 'package:e_commerce_ui_project/features/shop/controller/product/product_controller.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_ui_project/commons/widgets/containers/rounded_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/circular_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/price_text.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/product_title.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Sale tag
            TRoundedContainer(
              radius: TSizes.paddingSm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSm, vertical: TSizes.paddingXs),
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            //Price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0) TProductPriceText(price: '${product.price}', isDiscount: true),

            if (product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: controller.getProductPrice(product), isLarge: true)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // Title
        TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // Brand
        Row(
          children: [
            TCircularImage(
              width: 32,
              height: 32,
              backgroundColor: dark ? Colors.black : TColors.white,
              image: product.brand != null ? product.brand!.image : '',
              overlayColor: dark ? TColors.white : Colors.black,
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            TBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '', brandTextSizes: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
