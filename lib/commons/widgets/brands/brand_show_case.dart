import 'package:e_commerce_ui_project/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce_ui_project/commons/widgets/containers/rounded_container.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.paddingMd),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand with Products Count
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Brand top 3 Product Images

          Row(children: images.map((image) => brandTopProductImageWidget(image, dark)).toList())
        ],
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
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
