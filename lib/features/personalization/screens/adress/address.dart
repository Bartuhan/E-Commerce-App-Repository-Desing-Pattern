import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/features/personalization/controller/address_controller.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/adress/new_address.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/adress/widgets/single_address.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primaryColor,
        onPressed: () => Get.to(const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.allUserAddresses(),
                builder: (context, snapshot) {
                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (response != null) return response;

                  final address = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: address.length,
                      itemBuilder: (context, index) {
                        return TSingleAddress(
                          address: address[index],
                          onTap: () => controller.selectAddress(address[index]),
                        );
                      });
                }),
          ),
        ),
      ),
    );
  }
}
