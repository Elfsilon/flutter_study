import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/helpers/create_material_color.dart';

class Constants {
  static const borderRadius = BorderRadius.all(Radius.circular(16));
  static const double padXS = 12.0;
}

class AppColors {
  static final MaterialColor materialPrimary = createMaterialColor(AppColors.primary);
  static final MaterialColor materialSecondary = createMaterialColor(AppColors.secondary);
  static final MaterialColor materialDarkGrey = createMaterialColor(AppColors.darkGrey);
  static final MaterialColor materialGrey = createMaterialColor(AppColors.grey);

  static const Color primary = Color(0xFFD12462);
  static const Color secondary = Color(0xFF29171A);
  static const Color darkGrey = Color(0xFF151515);
  static const Color grey = Color(0xFF232323);
  static const Color success = Colors.green;
  static const Color successBg = Color(0x1E4CAF4F);
  static const Color warning = Colors.yellow;
  static const Color warningBg = Color(0x1EFFEB3B);
  static const Color info = Colors.deepPurple;
  static const Color infoBg = Color(0x1E683AB7);  
}

final appTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: AppColors.materialPrimary,
  scaffoldBackgroundColor: AppColors.materialDarkGrey,
  textTheme: const TextTheme(
    headline6: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 14.0),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Color.fromARGB(255, 124, 124, 124)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: MaterialStateProperty.all(const TextStyle(
        fontSize: 16,
      )),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: Constants.padXS)
      ),
      // minimumSize: MaterialStateProperty.all(const Size.fromHeight(0)),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: Constants.borderRadius,
      )),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.zero),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.grey,
    contentPadding: EdgeInsets.all(Constants.padXS),
    border: OutlineInputBorder(
      borderRadius: Constants.borderRadius,
    ),
    
  ),
);