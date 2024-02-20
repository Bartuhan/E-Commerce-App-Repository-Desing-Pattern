import 'package:e_commerce_ui_project/commons/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../commons/widgets/login_signup/index.dart';
import '../../../../utils/contants/index.dart';
import 'widgets/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo , title & Subtitle
              const TLoginHeader(),

              /// From
              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSingInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
