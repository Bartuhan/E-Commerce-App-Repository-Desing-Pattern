import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/boxes_shimmer.dart';
import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/list_tile_shimmer.dart';
import 'package:e_commerce_ui_project/utils/contants/sizes.dart';
import 'package:e_commerce_ui_project/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_ui_project/commons/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_ui_project/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_ui_project/features/shop/models/category/category_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          // Handle loader, No record or Error Message
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
            ],
          );
          final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    // Handle Loader , No Record or Error Message
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record Found
                    final products = snapshot.data!;

                    return TBrandShowCase(
                      brand: brand,
                      images: products.map((e) => e.thumbnail).toList(),
                    );
                  });
            },
          );
        });
  }
}
