import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/shop/controller/banner_controller.dart';
import 'package:e_commerce_ui_project/features/shop/controller/category_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Upload Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const TSectionHeading(title: 'Main Record'),
            const SizedBox(height: TSizes.spaceBtwItems),
            TSettingsMenuTile(
              icon: Iconsax.category,
              title: 'Upload Categories',
              trailing: const Icon(Iconsax.arrow_circle_up, color: TColors.primaryColor),
              onTap: () => CategoryController.instance.updloadCategory(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TSettingsMenuTile(
              icon: Iconsax.shop,
              title: 'Upload Brands',
              trailing: const Icon(Iconsax.arrow_circle_up, color: TColors.primaryColor),
              onTap: () {},
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TSettingsMenuTile(
              icon: Iconsax.shopping_cart,
              title: 'Upload Products',
              trailing: const Icon(Iconsax.arrow_circle_up, color: TColors.primaryColor),
              onTap: () {},
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TSettingsMenuTile(
              icon: Iconsax.radar,
              title: 'Upload Banners',
              trailing: const Icon(Iconsax.arrow_circle_up, color: TColors.primaryColor),
              onTap: () => BannerController().uploadData(),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const TSectionHeading(title: 'Relationships'),
            Text('Make sure you have already uploaded all the content above', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            TSettingsMenuTile(
              icon: Iconsax.main_component,
              title: 'Upload Brands & Categories Relation Data',
              trailing: const Icon(Iconsax.arrow_circle_up, color: TColors.primaryColor),
              onTap: () {},
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TSettingsMenuTile(
              icon: Iconsax.main_component,
              title: 'Upload Product Categories Relational Data',
              trailing: const Icon(Iconsax.arrow_circle_up, color: TColors.primaryColor),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
