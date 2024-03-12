import 'package:e_commerce_ui_project/commons/widgets/chips/choice_chip.dart';
import 'package:e_commerce_ui_project/commons/widgets/containers/rounded_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/price_text.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/product_title.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.paddingMd),
              backgroundColor: dark ? TColors.darkGrey : TColors.grey,
              child: Column(
                children: [
                  // Title , Price and Stock Status
                  Row(
                    children: [
                      const TSectionHeading(title: 'Variation'),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(title: 'Price : '),
                              // Actual Price
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  '₺${controller.selectedVariation.value.price}',
                                  style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: TSizes.spaceBtwItems / 2),
                              // Sale Price
                              TProductPriceText(price: '₺${controller.getVariationPrice()}'),
                            ],
                          ),
                          Row(
                            children: [
                              const TProductTitleText(title: 'Stock : '),
                              // Actual Price
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  TProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxlines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          //Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(title: attribute.name ?? ''),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                            final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);

                            return TChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(product, attribute.name, attributeValue);
                                        }
                                      }
                                    : null);
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const TSectionHeading(title: 'Size'),
          //     const SizedBox(height: TSizes.spaceBtwItems / 2),
          //     Wrap(
          //       spacing: 8,
          //       children: [
          //         TChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
          //         TChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
          //         TChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
          //       ],
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
