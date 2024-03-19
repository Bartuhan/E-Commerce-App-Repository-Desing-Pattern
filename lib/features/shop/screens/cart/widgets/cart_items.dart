import 'package:e_commerce_ui_project/commons/widgets/products/cart/cart_item.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/cart/product_quantity_with_add_and_remove_button.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/price_text.dart';
import 'package:e_commerce_ui_project/features/shop/controller/cart/cart_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        itemCount: cartController.cartItems.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (context, index) => Obx(
          () {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                TCartItem(cartItem: item),
                if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

                // Add Remove Button with total price
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Image Size
                          const SizedBox(width: 70),

                          // Add & Remove Buttons
                          TProductQuantityWithAddAndRemoveButton(
                            quantity: item.quantity,
                            add: () => cartController.addOneCart(item),
                            remove: () => cartController.removeOneFromCart(item),
                          ),
                        ],
                      ),
                      TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                    ],
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
