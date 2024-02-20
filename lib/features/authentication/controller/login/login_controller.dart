import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_ui_project/data/services/local_storage/db_manager.dart';
import 'package:e_commerce_ui_project/features/personalization/controller/user_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = DbManager.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = DbManager.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in ...', TImages.docerAnimation);

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if remember me is selected
      if (rememberMe.value) {
        DbManager.add('REMEMBER_ME_EMAIL', email.text.trim());
        DbManager.add('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        DbManager.delete('REMEMBER_ME_EMAIL');
        DbManager.delete('REMEMBER_ME_PASSWORD');
      }

      // Login user using Email and Password authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      if (kDebugMode) {
        print(userCredentials.user!.email);
      }
      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Google Authentication
      final userAuthentication = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUsesrRecord(userAuthentication);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
