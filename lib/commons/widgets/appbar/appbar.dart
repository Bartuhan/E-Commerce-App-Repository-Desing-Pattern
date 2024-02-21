import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/device/device_utils.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onPressed;
  final VoidCallback? leadingOnPressed;

  const TAppBar({
    super.key,
    this.title,
    this.showBackArrow = true,
    this.leadingIcon,
    this.actions,
    this.onPressed = _defaultOnPressed,
    this.leadingOnPressed,
  });

  static void _defaultOnPressed() => Get.back();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingMd),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow //
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                ))
            : leadingIcon != null
                ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppbarHeight());
}
