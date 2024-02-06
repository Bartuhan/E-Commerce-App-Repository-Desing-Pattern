import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/appbar/tabbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce_ui_project/commons/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_ui_project/commons/widgets/containers/search_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/screens/store/widget/category_tab.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: false,
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
            )
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
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                        itemCount: 4,
                        mainAxixExtends: 80,
                        itembuilder: (context, index) {
                          return const TBrandCard();
                        },
                      )
                    ],
                  ),
                ),

                // Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
