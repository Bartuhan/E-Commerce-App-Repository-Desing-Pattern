import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/images/circular_image.dart';
import 'package:e_commerce_ui_project/commons/widgets/texts/section_headings.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Prafile Picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const TCircularImage(image: TImages.user, width: 80, height: 80, padding: 0),
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

                TProfileMenu(title: 'Name', value: 'Coding with T', onPressed: () {}),
                TProfileMenu(title: 'Username', value: 'coding_with_t', onPressed: () {}),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                // Heading Personel info
                const TSectionHeading(title: 'Personal Info'),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(title: 'User ID', value: '456889', icon: Iconsax.copy, onPressed: () {}),
                TProfileMenu(title: 'E-mail', value: 'coding_with_t', onPressed: () {}),
                TProfileMenu(title: 'Phone Number', value: '+90-543-2480000', onPressed: () {}),
                TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                TProfileMenu(title: 'Date of Birth', value: '22 Nov 1993', onPressed: () {}),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
