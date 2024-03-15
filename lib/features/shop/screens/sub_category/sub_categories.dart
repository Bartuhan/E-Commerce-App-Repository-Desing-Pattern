import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/horizontal_product_shimmer.dart';
import 'package:e_commerce_ui_project/features/shop/controller/category_controller.dart';
import 'package:e_commerce_ui_project/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_ui_project/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/rounded_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/product_cards/product_cards_horizontal.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/models/category/category_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(category.name)),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // Banner
            const TRoundedImage(width: double.infinity, imagePath: TImages.promoBanner3, applyImageRadius: true),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Sub-Categories
            FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  //const loader = THorizontalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (widget != null) return widget;

                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    itemCount: subCategories.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final subCategory = subCategories[index];

                      return FutureBuilder(
                          future: controller.getCategoryProducts(categoryId: subCategory.id),
                          builder: (context, snapshot) {
                            const loader = THorizontalProductShimmer();
                            final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                            if (widget != null) return widget;

                            final products = snapshot.data!;

                            return Column(
                              children: [
                                // Heading
                                TSectionHeading(
                                  title: subCategory.name,
                                  showActionButton: true,
                                  onPressed: () => Get.to(() => AllProduct(
                                        title: subCategory.name,
                                        futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                      )),
                                ),
                                const SizedBox(height: TSizes.spaceBtwItems / 2),

                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    itemCount: products.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                                    itemBuilder: (context, index) => TProductCardHorizontal(product: products[index]),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  );
                })
          ],
        ),
      )),
    );
  }
}
