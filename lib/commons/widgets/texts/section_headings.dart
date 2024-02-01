import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = false,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: textColor ?? (dark ? TColors.dark : TColors.white),
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        // İf Show action button
        if (showActionButton)
          TextButton(
              onPressed: onPressed,
              child: Text(
                buttonTitle,
                style: Theme.of(context).textTheme.bodySmall!.apply(color: textColor ?? TColors.white),
              ))
      ],
    );
  }
}
