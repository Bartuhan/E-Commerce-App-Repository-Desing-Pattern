import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/repositories/user/user_repository.dart';
import 'package:e_commerce_ui_project/features/personalization/controller/user_controller.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_ui_project/utils/contants/image_strings.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Updating...', TImages.docerAnimation);

      // From validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user' first & last name in the Firebase FireStore
      Map<String, dynamic> name = {'firstName': firstName.text, 'lastName': lastName.text};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text;
      userController.user.value.lastName = lastName.text;

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show success message
      Tloaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated');

      // Move to previous screen
      Get.off(const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
