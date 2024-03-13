import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce_ui_project/commons/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/brands_shimmer.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/controller/brand_controller.dart';
// import 'package:e_commerce_ui_project/features/shop/models/brand/brand_model.dart';
import 'package:e_commerce_ui_project/features/shop/screens/all_brands/brand_products.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Brands')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Headings
              const TSectionHeading(title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Brands
              Obx(
                () {
                  if (controller.isLoading.value) return const TBrandsShimmer();
                  if (controller.allBrands.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                  }

                  return TGridLayout(
                    itemCount: controller.allBrands.length,
                    mainAxixExtends: 80,
                    itembuilder: (context, index) {
                      final brand = controller.allBrands[index];
                      return TBrandCard(
                        brand: brand,
                        onTap: () => Get.to(TBrandProducts(brand: brand)),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
