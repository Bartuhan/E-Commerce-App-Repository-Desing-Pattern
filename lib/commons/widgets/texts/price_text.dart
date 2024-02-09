import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    required this.price,
    this.currencySign = '₺',
    this.maxlines = 1,
    this.isDiscount = false,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxlines;
  final bool isLarge;
  final bool isDiscount;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: isDiscount
          ? Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)
          : isLarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
