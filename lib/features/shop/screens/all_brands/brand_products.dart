import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/sortable/sortable_product.dart';
import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:e_commerce_ui_project/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_ui_project/features/shop/models/brand/brand_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TBrandProducts extends StatelessWidget {
  const TBrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brand detail
              TBrandCard(brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),

              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    // Handle loader, No Record, or error message
                    const loader = TVericalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record found
                    final brandProducts = snapshot.data!;

                    return TSortableProducts(products: brandProducts);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
