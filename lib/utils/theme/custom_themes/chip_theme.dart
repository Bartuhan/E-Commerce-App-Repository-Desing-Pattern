import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  // Light Theme ---------------------------------------------------------------
  static ChipThemeData lightTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      checkmarkColor: Colors.white);

  // Dark Theme ----------------------------------------------------------------
  static ChipThemeData darkTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: Colors.deepPurple,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
