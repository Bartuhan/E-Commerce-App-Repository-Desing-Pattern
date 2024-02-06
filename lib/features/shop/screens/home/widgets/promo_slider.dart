import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_ui_project/commons/widgets/containers/circular_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/features/shop/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/contants/index.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => TRoundedImage(imagePath: url)).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < banners.length; i++)
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
}
