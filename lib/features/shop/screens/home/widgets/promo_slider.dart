import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_ui_project/commons/widgets/containers/circular_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_commerce_ui_project/features/shop/controller/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/contants/index.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // Loader
      if (controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);

      // No data found
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      } else {
        // Widget
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) => controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map((banner) => TRoundedImage(
                        imagePath: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      TCircularContainer(
                        size: 20,
                        isLined: true,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor: controller.carousalCurrentIndex.value == i //
                            ? TColors.primaryColor
                            : TColors.grey,
                      ),
                  ],
                )),
          ],
        );
      }
    });
  }
}
