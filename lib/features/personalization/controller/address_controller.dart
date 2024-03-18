import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/repositories/address/address_repository.dart';
import 'package:e_commerce_ui_project/features/personalization/models/address_model.dart';
import 'package:e_commerce_ui_project/utils/contants/image_strings.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  // Fetch all user specific addresses
  Future<List<AddressModel>> allUserAddresses() async {
    try {
      final address = await addressRepository.fetchUserAddresses();
      selectedAddress.value = address.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return address;
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Addresses not found', message: e.toString());
      return [];
    }
  }

  Future<void> selectAddress(AddressModel newSelectedAddresses) async {
    try {
      // Clear the 'selected' field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }
      // Assign selected address
      newSelectedAddresses.selectedAddress = true;
      selectedAddress.value = newSelectedAddresses;

      // Set the 'selected' field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Error in Selection', message: e.toString());
    }
  }

  Future<void> addNewAddress() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Starting Address...', TImages.docerAnimation);

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      // Update selected address
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show success message
      Tloaders.successSnackBar(title: 'Congratulations', message: 'Your address has benn saved successfully.');

      // Refresh Address data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
    }
  }

  // Function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
