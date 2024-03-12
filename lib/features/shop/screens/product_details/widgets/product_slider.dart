import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/custom_shapes/custom_curved_edge_widget.dart';
import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/features/shop/controller/product/images_controller.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductSlider extends StatelessWidget {
  const TProductSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 3),
                child: Obx(() {
                  final image = controller.selectedProductImages.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
                        value: progress.progress,
                        color: TColors.primaryColor,
                      ),
                    ),
                  );
                }),
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
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) => Obx(
                    () {
                      final imageSelected = controller.selectedProductImages.value == images[index];
                      return TRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(color: imageSelected ? TColors.primaryColor : Colors.transparent),
                        padding: const EdgeInsets.all(TSizes.paddingSm),
                        imagePath: images[index],
                        onPressed: () => controller.selectedProductImages.value = images[index],
                      );
                    },
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
