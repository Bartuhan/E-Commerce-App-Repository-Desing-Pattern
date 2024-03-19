import 'package:flutter/material.dart';

import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/product_title.dart';
import 'package:e_commerce_ui_project/features/shop/models/cart/cart_item_modei.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        TRoundedImage(
          imagePath: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.paddingSm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Title , Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(child: TProductTitleText(title: cartItem.title, maxlines: 1)),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(text: e.key, style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(text: e.value, style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
