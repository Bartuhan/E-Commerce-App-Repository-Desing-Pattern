import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_ui_project/data/repositories/user/user_repository.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce_ui_project/features/personalization/models/user_model.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/profile/widget/re_auth_user_login_form.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = true.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchuserRecord();
  }

  Future<void> fetchuserRecord() async {
    try {
      // Loading
      profileLoading.value = true;

      // Fetch user
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      // Stop Loading
      profileLoading.value = false;
    }
  }

  Future<void> saveUsesrRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert Name to first and last name
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // Map data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Tloaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You van re-save your data in your profile.',
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.paddingMd),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removerd permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.paddingLg), child: Text('Delete')),
        ),
        cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancel')));
  }

  // Delete User Account
  Future<void> deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing...', TImages.docerAnimation);

      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Tloaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Re Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing...', TImages.docerAnimation);

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text, verifyPassword.text);
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Tloaders.warningSnackBar(title: 'Oh Snap!', message: '');
    }
  }
}
