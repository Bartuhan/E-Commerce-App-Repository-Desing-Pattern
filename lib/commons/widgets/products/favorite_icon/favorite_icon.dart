import 'package:e_commerce_ui_project/commons/widgets/icons/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TCircularIcon(icon: Iconsax.heart5, iconColor: Colors.red);
  }
}
