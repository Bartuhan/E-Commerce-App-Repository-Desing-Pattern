import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/custom_shapes/custom_curved_edge_widget.dart';
import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductSlider extends StatelessWidget {
  const TProductSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 3),
                child: Image(
                  image: AssetImage(TImages.productImage5),
                ),
              ),
            ),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 60,
              left: TSizes.defaultSpace * 1.5,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primaryColor),
                    padding: const EdgeInsets.all(TSizes.paddingSm),
                    imagePath: TImages.productImage3,
                  ),
                ),
              ),
            ),

            // Appbar Icons
            const TAppBar(
              actions: [TCircularIcon(icon: Iconsax.heart5, iconColor: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
