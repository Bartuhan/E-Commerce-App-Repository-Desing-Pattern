import 'package:e_commerce_ui_project/features/personalization/controller/user_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    //Get.put(SignupController());
    Get.put(UserController());
  }
}
