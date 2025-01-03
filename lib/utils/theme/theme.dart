import 'package:clg/utils/theme/custom_theme/appbar_theme.dart';
import 'package:clg/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:clg/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:clg/utils/theme/custom_theme/chip_theme.dart';
import 'package:clg/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:clg/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:clg/utils/theme/custom_theme/text_filed_theme.dart';
import 'package:clg/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{

  TAppTheme._();

  ///LightTheme


  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lighttheme,
    elevatedButtonTheme:TElevatedButtonTheme.lightElevatedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: TTextFromFilledTheme.lightInputDecorationTheme,

  );

  ///DarkTheme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darktheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: TTextFromFilledTheme.darkInputDecorationTheme,

  );

}