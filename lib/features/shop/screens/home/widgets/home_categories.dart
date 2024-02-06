import 'package:e_commerce_ui_project/commons/widgets/image_text_widgets/category_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          // Popular Categories
          const TSectionHeading(title: 'Popular Categories'),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Categories Image
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TVerticalImage(
                  image: TImages.clothIcon,
                  title: 'Clothes',
                  onPress: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
