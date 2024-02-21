import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_ui_project/utils/contants/image_strings.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetpasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      // Form validation
      if (!forgetpasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email: email.text.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success Screen
      Tloaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(ResetPasswordScreen(email: email.text));
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email: email);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success Screen
      Tloaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
