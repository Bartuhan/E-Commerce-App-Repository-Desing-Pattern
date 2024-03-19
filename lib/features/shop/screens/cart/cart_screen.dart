import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_ui_project/features/shop/controller/cart/cart_controller.dart';
import 'package:e_commerce_ui_project/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_ui_project/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_ui_project/navigation_menu.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is EMPTY.',
            animation: TImages.docerAnimation,
            actionText: 'Let\'s fill it',
            showAction: true,
            onActionPresesed: () => Get.off(() => const NavigationMenu()),
          );

          return controller.cartItems.isEmpty
              ? emptyWidget
              : const Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: TCartItems(),
                );
        },
      ),
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const SizedBox();
        } else {
          return Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: ElevatedButton(onPressed: () => Get.to(const CheckoutScreen()), child: Text('Checkout ₺${controller.totalCartPrice.value}')),
          );
        }
      }),
    );
  }
}
