import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce_ui_project/commons/widgets/list_tiles/user_profile_tile.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/adress/address.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce_ui_project/features/shop/screens/order/order.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          // Header
          SizedBox(
            height: THelperFunctions.screenHeight() * 0.27,
            child: TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    showBackArrow: false,
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineLarge!.apply(color: TColors.white),
                    ),
                  ),
                  TUserProfileTile(
                    onPressed: () => Get.to(const ProfileScreen()),
                  ),
                ],
              ),
            ),
          ),
          // Body
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Account Settings
                const TSectionHeading(title: 'Account Settings'),
                const SizedBox(height: TSizes.defaultSpace),
                TSettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Address',
                  subTitle: 'Set shopping delivery address',
                  onTap: () => Get.to(const UserAddressScreen()),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subTitle: 'Add, remove products and move to checkout',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subTitle: 'In-progress and Competed Orders',
                  onTap: () => Get.to(const OrderScreen()),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subTitle: 'Withdraw balance to registered bank account',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subTitle: 'List of all the discounted coupons',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notifications',
                  subTitle: 'Set any kinf of notification message',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Pricvacy',
                  subTitle: 'Manage data usage and connected accounts',
                  onTap: () {},
                ),

                // App Settings
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(title: 'App Settings'),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your cloud Firebase'),
                TSettingsMenuTile(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subTitle: 'Set recommendation on location',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_user,
                  title: 'Safe Mode',
                  subTitle: 'Search result is safe for all ages',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subTitle: 'Set image quality to be seen',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: () {}, child: const Text('Logout')),
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 2.5),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
