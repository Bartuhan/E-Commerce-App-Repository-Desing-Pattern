import 'package:e_commerce_ui_project/commons/widgets/containers/search_container.dart';
import 'package:e_commerce_ui_project/commons/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header

            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  const HomeAppBar(),

                  // SearchBar
                  TSearchContainer(
                    showBorder: false,
                    text: 'Search in Store',
                    ontap: () {},
                  ),

                  // Categories
                  const THomeCategories(),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider

                  const TPromoSlider(
                    banners: [TImages.banner1, TImages.banner2, TImages.banner3, TImages.banner4],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  TSectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Product Cards
                  TGridLayout(
                    itemCount: 10,
                    itembuilder: (context, index) => const TProductCardVertical(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
