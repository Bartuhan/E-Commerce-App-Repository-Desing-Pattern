import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_commerce_ui_project/features/authentication/controller/signup/signup_controller.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/signup/widget/terms_and_conditions.dart';
import 'package:e_commerce_ui_project/utils/validators/validators.dart';

import '../../../../../utils/contants/index.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// FirstName & LastName

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidatorHelper.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) => TValidatorHelper.validateEmptyText('Last Name', value),
                  controller: controller.lastName,
                  decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Username

          TextFormField(
            controller: controller.userName,
            validator: (value) => TValidatorHelper.validateEmptyText('Username', value),
            decoration: const InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email

          TextFormField(
            controller: controller.email,
            validator: (value) => TValidatorHelper.validateEmail(value),
            decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number

          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidatorHelper.validatePhoneNumber(value),
            decoration: const InputDecoration(labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password

          TextFormField(
            controller: controller.password,
            validator: (value) => TValidatorHelper.validatePassword(value),
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Terms & Conditions Checkbox

          const TTermsAndConditions(),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Sign up Button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
