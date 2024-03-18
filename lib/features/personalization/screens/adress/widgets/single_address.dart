import 'package:e_commerce_ui_project/commons/widgets/containers/rounded_container.dart';
import 'package:e_commerce_ui_project/features/personalization/controller/address_controller.dart';
import 'package:e_commerce_ui_project/features/personalization/models/address_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: onTap,
            child: TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.paddingMd),
              showBorder: true,
              backgroundColor: selectedAddress ? TColors.primaryColor.withOpacity(0.5) : Colors.transparent,
              borderColor: selectedAddress
                  ? Colors.transparent
                  : dark
                      ? TColors.darkerGrey
                      : TColors.grey,
              margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 5,
                    child: Icon(
                      selectedAddress ? Iconsax.tick_circle5 : null,
                      color: selectedAddress
                          ? dark
                              ? TColors.light
                              : TColors.dark.withOpacity(0.7)
                          : null,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: TSizes.paddingSm / 2),
                      Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: TSizes.paddingSm / 2),
                      Text(address.toString(), softWrap: true),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
