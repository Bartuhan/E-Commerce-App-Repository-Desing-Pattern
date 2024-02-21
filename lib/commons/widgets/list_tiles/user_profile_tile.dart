import 'package:e_commerce_ui_project/commons/widgets/images/circular_image.dart';
import 'package:e_commerce_ui_project/features/personalization/controller/user_controller.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}
