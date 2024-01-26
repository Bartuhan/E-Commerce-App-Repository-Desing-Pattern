import 'package:e_commerce_ui_project/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_commerce_ui_project/utils/theme/custom_themes/bottomsheet_theme.dart';
import 'package:e_commerce_ui_project/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_commerce_ui_project/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_commerce_ui_project/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_commerce_ui_project/utils/theme/custom_themes/text_form_field_theme.dart';
import 'package:e_commerce_ui_project/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  // Light Theme --------------------------------------------------------------
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightTheme,
    appBarTheme: TAppBarTheme.lightTheme,
    bottomSheetTheme: TBottomSheetTheme.lightThemeData,
    checkboxTheme: TCheckBoxTheme.lightTheme,
    chipTheme: TChipTheme.lightTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightTheme,
  );

  // Dark Theme -----------------------------------------------------------------
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkTheme,
    appBarTheme: TAppBarTheme.darkTheme,
    bottomSheetTheme: TBottomSheetTheme.darkThemeData,
    checkboxTheme: TCheckBoxTheme.darkTheme,
    chipTheme: TChipTheme.darkTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkTheme,
  );
}
