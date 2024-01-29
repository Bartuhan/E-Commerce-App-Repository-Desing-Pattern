import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  // Light Theme --------------------------------------------------------------
  static OutlinedButtonThemeData lightTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  // Dark Theme ---------------------------------------------------------------
  static OutlinedButtonThemeData darkTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.deepPurple),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
