import 'package:flutter/material.dart';

import 'package:e_commerce_ui_project/commons/widgets/containers/rounded_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/circular_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_ui_project/features/shop/models/brand/brand_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    Key? key,
    required this.brand,
    this.showBorder = true,
    this.onTap,
  }) : super(key: key);

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.paddingSm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: TCircularImage(
                width: 56,
                height: 56,
                image: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title: brand.name, brandTextSizes: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
