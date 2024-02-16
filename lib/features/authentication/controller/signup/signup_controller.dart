import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/repositories/authentication/authentication_repository.dart';
// import 'package:e_commerce_ui_project/data/repositories/authentication/authentication_repository.dart';
// import 'package:e_commerce_ui_project/data/repositories/user/user_repository.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_ui_project/features/personalization/models/user_model.dart';
// import 'package:e_commerce_ui_project/features/personalization/models/user_model.dart';
import 'package:e_commerce_ui_project/utils/contants/image_strings.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Signup
  Future<void> signup() async {
    try {
      // Start Loading
      //TFullScreenLoader.openLoadingDialog('We are proccessing your information...', TImages.docerAnimation);

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy check
      if (!privacyPolicy.value) {
        Tloaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in Firebase
      //final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email: email.text, password: password.text);

      // Save Authenticated user in data in Firebase Firestore
      // final newUser = UserModel(
      //   id: userCredential.user!.uid,
      //   firstName: firstName.text.trim(),
      //   lastName: lastName.text.trim(),
      //   userName: userName.text.trim(),
      //   email: email.text.trim(),
      //   phoneNumber: phoneNumber.text.trim(),
      //   profilePicture: '',
      // );

      // final userRepo = Get.put(UserRpository());
      // userRepo.saveUserRecord(newUser);

      // Remove Loader
      //TFullScreenLoader.stopLoading();

      // Show Success message
      Tloaders.successSnackBar(title: 'Congratulations', message: 'Your Account has been created');

      // Move to Verify Email Screen
      Get.to(const VerifyEmailScreen());
    } catch (e) {
      // Show some Generic Error to the user
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
