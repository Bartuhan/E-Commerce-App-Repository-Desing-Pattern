import 'package:e_commerce_ui_project/commons/widgets/containers/search_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/controller/product/product_controller.dart';
import 'package:e_commerce_ui_project/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header

            SizedBox(
              height: THelperFunctions.screenHeight() * 0.47,
              child: const TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    // AppBar
                    HomeAppBar(),

                    // SearchBar
                    TSearchContainer(showBorder: false, text: 'Search in Store'),

                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          // Popular Categories
                          TSectionHeading(title: 'Popular Categories'),
                          SizedBox(height: TSizes.spaceBtwItems),

                          // Categories Image
                          THomeCategories(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider

                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  TSectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () => Get.to(
                      () => AllProduct(
                        title: 'Popular Products',
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Product Cards
                  Obx(() {
                    if (controller.isLoading.value) return const TVericalProductShimmer();

                    if (controller.featuredProducts.isEmpty) return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium));
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itembuilder: (context, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
