import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/features/personalization/controller/address_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => TValidatorHelper.validateEmptyText('Name', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => TValidatorHelper.validateEmptyText('Phone Number', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.street,
                      validator: (value) => TValidatorHelper.validateEmptyText('Street', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
                    )),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                      controller: controller.postalCode,
                      validator: (value) => TValidatorHelper.validateEmptyText('Postal Code', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
                    )),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.city,
                      validator: (value) => TValidatorHelper.validateEmptyText('City', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                    )),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                      controller: controller.state,
                      validator: (value) => TValidatorHelper.validateEmptyText('State', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                    )),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) => TValidatorHelper.validateEmptyText('Country', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.addNewAddress(), child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
