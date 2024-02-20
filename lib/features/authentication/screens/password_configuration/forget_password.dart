import 'package:e_commerce_ui_project/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: dark ? TColors.light : TColors.dark,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwItems * 2),

            // Text Fields

            TextFormField(decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right))),
            const SizedBox(height: TSizes.spaceBtwSections),
            // Submit Buttons

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(const ResetPasswordScreen()), child: const Text(TTexts.submit))),
          ],
        ),
      ),
    );
  }
}
