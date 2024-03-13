import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/appbar/tabbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce_ui_project/commons/widgets/containers/search_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/brands_shimmer.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_ui_project/features/shop/controller/category_controller.dart';
import 'package:e_commerce_ui_project/features/shop/screens/all_brands/all_brands.dart';
import 'package:e_commerce_ui_project/features/shop/screens/all_brands/brand_products.dart';
import 'package:e_commerce_ui_project/features/shop/screens/store/widget/category_tab.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: false,
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
            TCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      // Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in the Store',
                        showBorder: true,
                        showBackGround: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // Feature Brands
                      TSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () => Get.to(const AllBrandsScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      Obx(
                        () {
                          if (brandController.isLoading.value) return const TBrandsShimmer();

                          if (brandController.featureBrands.isEmpty) {
                            return Center(child: Text('No data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                          }
                          return TGridLayout(
                            itemCount: brandController.featureBrands.length,
                            mainAxixExtends: 80,
                            itembuilder: (context, index) {
                              final brand = brandController.featureBrands[index];
                              return TBrandCard(
                                brand: brand,
                                onTap: () => Get.to(() => TBrandProducts(brand: brand)),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),

                // Tabs
                bottom: TTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
