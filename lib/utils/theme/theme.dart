import 'package:flutter/material.dart';
import 'custom_themes/index.dart';

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
    outlinedButtonTheme: TOutlinedButtonTheme.lightTheme,
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
    outlinedButtonTheme: TOutlinedButtonTheme.darkTheme,
  );
}
