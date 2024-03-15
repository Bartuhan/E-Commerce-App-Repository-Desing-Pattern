import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:e_commerce_ui_project/features/shop/controller/product/favuorite_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    return Obx(() => TCircularIcon(
          icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
          iconColor: controller.isFavorite(productId) ? TColors.error : null,
          onPressed: () => controller.toggleFavoriteProduct(productId),
        ));
  }
}
