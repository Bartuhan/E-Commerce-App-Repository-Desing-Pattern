import 'package:e_commerce_ui_project/features/shop/controller/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg * 2),
          topRight: Radius.circular(TSizes.cardRadiusLg * 2),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                  width: 40,
                  height: 40,
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkGrey,
                  iconColor: TColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value = -1,
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                  width: 40,
                  height: 40,
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  iconColor: TColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSizes.paddingMd),
                  side: const BorderSide(color: TColors.black),
                  backgroundColor: TColors.black,
                ),
                child: const Text('Add to Cart'))
          ],
        ),
      ),
    );
  }
}
