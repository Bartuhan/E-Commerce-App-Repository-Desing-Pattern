import 'package:e_commerce_ui_project/commons/widgets/containers/circular_container.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final Color? color = THelperFunctions.getColor(text);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: color != null ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: color != null ? TCircularContainer(size: 50, backgroundColor: color) : null,
        shape: color != null ? const CircleBorder() : null,
        backgroundColor: color,
        selectedColor: color,
        labelPadding: color != null ? EdgeInsets.zero : null,
        padding: color != null ? EdgeInsets.zero : null,
      ),
    );
  }
}
