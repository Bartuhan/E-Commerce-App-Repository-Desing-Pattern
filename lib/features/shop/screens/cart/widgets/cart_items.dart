import 'package:e_commerce_ui_project/commons/widgets/products/cart/cart_item.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/cart/product_quantity_with_add_and_remove_button.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/price_text.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (context, index) => Column(
        children: [
          const TCartItem(),
          if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

          // Add Remove Button with total price
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Image Size
                    SizedBox(width: 70),

                    // Add & Remove Buttons
                    TProductQuantityWithAddAndRemoveButton(),
                  ],
                ),
                TProductPriceText(price: '256'),
              ],
            )
        ],
      ),
    );
  }
}
