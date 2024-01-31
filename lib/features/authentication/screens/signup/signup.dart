import 'package:e_commerce_ui_project/commons/widgets/login_signup/form_divider.dart';
import 'package:e_commerce_ui_project/commons/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/signup/widget/signup_form.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(iconTheme: const IconThemeData(color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // From
            const TSignupForm(),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Divider
            TFormDivider(dividerText: TTexts.orSingUpWith.capitalize!),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Social Buttons
            const TSocialButtons(),
          ],
        ),
      ),
    );
  }
}
