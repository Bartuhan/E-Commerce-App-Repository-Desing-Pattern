import 'package:e_commerce_ui_project/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce_ui_project/commons/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? TColors.darkerGrey : TColors.grey)),
          Text(TTexts.homeAppbarSubtitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: dark ? TColors.dark : TColors.white)),
        ],
      ),
      actions: [
        TCartCounterIcon(onPressed: () {}),
      ],
    );
  }
}
