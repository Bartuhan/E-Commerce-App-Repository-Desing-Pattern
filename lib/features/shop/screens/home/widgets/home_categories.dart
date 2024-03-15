import 'package:e_commerce_ui_project/commons/widgets/image_text_widgets/category_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/shimmer_effect/category_shimmer.dart';
import 'package:e_commerce_ui_project/features/shop/controller/category_controller.dart';
import 'package:e_commerce_ui_project/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        categoryController.onInit();
        return const TCategoryShimmer();
      }

      if (categoryController.featuredCategories.isEmpty) {
        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImage(
              image: category.image,
              title: category.name,
              onPress: () => Get.to(() => SubCategoryScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
