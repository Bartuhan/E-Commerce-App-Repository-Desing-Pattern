import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/circular_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/personalization/controller/user_controller.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/profile/widget/change_name.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:e_commerce_ui_project/navigation_menu.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: TAppBar(
          title: const Text('Profile'),
          onPressed: () => Get.off(const NavigationMenu()),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Profile Picture
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        TCircularImage(
                          isNetworkImage: controller.user.value.profilePicture != '' ? true : false,
                          image: controller.user.value.profilePicture == '' //
                              ? TImages.user
                              : controller.user.value.profilePicture,
                          width: 80,
                          height: 80,
                          padding: 0,
                        ),
                        TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
                      ],
                    ),
                  ),

                  // Details
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(title: 'Profile Information'),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.off(const ChangeName())),
                  TProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),

                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Heading Personel info
                  const TSectionHeading(title: 'Personal Info'),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
                  TProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
                  TProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
                  TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                  TProfileMenu(title: 'Date of Birth', value: '22 Nov 1993', onPressed: () {}),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  Center(
                    child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
