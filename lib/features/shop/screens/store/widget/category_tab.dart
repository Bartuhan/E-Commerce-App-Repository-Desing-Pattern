import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:e_commerce_ui_project/features/shop/controller/category_controller.dart';
import 'package:e_commerce_ui_project/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_ui_project/features/shop/screens/store/widget/category_brands.dart';
import 'package:e_commerce_ui_project/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_ui_project/commons/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/models/category/category_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              CategoryBrands(category: category),

              // Products
              FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final response = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: const TVericalProductShimmer(),
                    );
                    if (response != null) return response;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        TSectionHeading(
                          title: 'You might like',
                          showActionButton: true,
                          onPressed: () => Get.to(
                            () => AllProduct(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                            ),
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        TGridLayout(itemCount: products.length, itembuilder: (context, index) => TProductCardVertical(product: products[index])),
                        const SizedBox(height: TSizes.spaceBtwItems),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
