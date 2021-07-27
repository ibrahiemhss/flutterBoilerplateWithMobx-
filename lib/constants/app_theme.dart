/**
 * Creating custom color palettes is part of creating a custom app. The idea is to create
 * your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
 * object with those colors you just defined.
 *
 * Resource:
 * A good resource would be this website: http://mcg.mbitson.com/
 * You simply need to put in the colour you wish to use, and it will generate all shades
 * for you. Your primary colour will be the `500` value.
 *
 * Colour Creation:
 * In order to create the custom colours you need to create a `Map<int, Color>` object
 * which will have all the shade values. `const Color(0xFF...)` will be how you create
 * the colours. The six character hex code is what follows. If you wanted the colour
 * #114488 or #D39090 as primary colours in your theme, then you would have
 * `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
 *
 * Usage:
 * In order to use this newly created theme or even the colours in it, you would just
 * `import` this file in your project, anywhere you needed it.
 * `import 'path/to/theme.dart';`
 */

import 'package:flutter/material.dart';
import 'package:my_boilerplate/constants/colors.dart';
import 'package:my_boilerplate/constants/font_family.dart';

final ThemeData themeData = new ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 96.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.5,
          color: AppColors.mainColor[900]),
      headline2: TextStyle(
          fontSize: 60.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
          color: AppColors.mainColor[900]),
      headline3: TextStyle(
          fontSize: 48.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.0,
          color: AppColors.mainColor[900]),
      headline4: TextStyle(
          fontSize: 34.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.25,
          color: AppColors.mainColor[900]),
      headline5: TextStyle(
          fontSize: 24.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.0,
          color: AppColors.mainColor[900]),
      headline6: TextStyle(
          fontSize: 20.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: AppColors.mainColor[900]),
      subtitle1: TextStyle(
          fontSize: 16.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: AppColors.grey[900]),
      subtitle2: TextStyle(
          fontSize: 14.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.10,
          color: AppColors.grey[600]),
      bodyText1: TextStyle(
          fontSize: 16.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.grey[500]),
      bodyText2: TextStyle(
          fontSize: 14.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.grey[500]),
      button: TextStyle(
          fontSize: 14.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.75,
          color: AppColors.grey[500]),
      caption: TextStyle(
          fontSize: 12.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.grey[500]),
      overline: TextStyle(
          fontSize: 10.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.grey[500]),
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 96.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: AppColors.mainColor[900]),
      headline2: TextStyle(
          fontSize: 60.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: AppColors.mainColor[900]),
      headline3: TextStyle(
          fontSize: 48.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          color: AppColors.mainColor[900]),
      headline4: TextStyle(
          fontSize: 34.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.mainColor[900]),
      headline5: TextStyle(
          fontSize: 24.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          color: AppColors.mainColor[900]),
      headline6: TextStyle(
          fontSize: 20.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColors.mainColor[900]),
      subtitle1: TextStyle(
          fontSize: 16.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: AppColors.grey[900]),
      subtitle2: TextStyle(
          fontSize: 14.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.10,
          color: AppColors.grey[600]),
      bodyText1: TextStyle(
          fontSize: 16.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.grey[500]),
      bodyText2: TextStyle(
          fontSize: 14.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.grey[500]),
      button: TextStyle(
          fontSize: 14.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.75,
          color: AppColors.grey[500]),
      caption: TextStyle(
          fontSize: 12.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.grey[500]),
      overline: TextStyle(
          fontSize: 10.0,
          fontFamily: FontFamily.mainFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.grey[500]),
    ),
    iconTheme: new IconThemeData(color: AppColors.mainColor[500]),
    appBarTheme: new AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      elevation: 16,
      iconTheme: IconThemeData(color: AppColors.mainColor[500]),
    ),
    buttonColor: AppColors.mainColor[600],
    textSelectionColor: AppColors.mainColor[400],
    textSelectionHandleColor: AppColors.mainColor[900],
    fontFamily: FontFamily.mainFont,
    brightness: Brightness.light,
    primarySwatch:
        MaterialColor(AppColors.mainColor[200]!.value, AppColors.mainColor),
    primaryColor: Colors.white,
    primaryColorBrightness: Brightness.light,
    backgroundColor: Colors.transparent,
    accentColor: AppColors.mainColor[900],
    accentColorBrightness: Brightness.light);

final ThemeData themeDataDark = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 96.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: AppColors.mainColor[50]),
    headline2: TextStyle(
        fontSize: 60.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: AppColors.mainColor[50]),
    headline3: TextStyle(
        fontSize: 48.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: AppColors.mainColor[50]),
    headline4: TextStyle(
        fontSize: 34.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.mainColor[50]),
    headline5: TextStyle(
        fontSize: 24.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: AppColors.mainColor[50]),
    headline6: TextStyle(
        fontSize: 20.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.mainColor[50]),
    subtitle1: TextStyle(
        fontSize: 16.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: AppColors.mainColor[50]),
    subtitle2: TextStyle(
        fontSize: 14.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
        color: AppColors.grey[50]),
    bodyText1: TextStyle(
        fontSize: 16.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.grey[50]),
    bodyText2: TextStyle(
        fontSize: 14.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.grey[50]),
    button: TextStyle(
        fontSize: 14.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.75,
        color: AppColors.grey[50]),
    caption: TextStyle(
        fontSize: 12.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.grey[50]),
    overline: TextStyle(
        fontSize: 10.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: AppColors.grey[50]),
  ),
  primaryTextTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 96.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: AppColors.mainColor[50]),
    headline2: TextStyle(
        fontSize: 60.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: AppColors.mainColor[50]),
    headline3: TextStyle(
        fontSize: 48.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: AppColors.mainColor[50]),
    headline4: TextStyle(
        fontSize: 34.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.mainColor[50]),
    headline5: TextStyle(
        fontSize: 24.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: AppColors.mainColor[50]),
    headline6: TextStyle(
        fontSize: 20.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.mainColor[50]),
    subtitle1: TextStyle(
        fontSize: 16.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: AppColors.mainColor[50]),
    subtitle2: TextStyle(
        fontSize: 14.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
        color: AppColors.grey[50]),
    bodyText1: TextStyle(
        fontSize: 16.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.grey[50]),
    bodyText2: TextStyle(
        fontSize: 14.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.grey[50]),
    button: TextStyle(
        fontSize: 14.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.75,
        color: AppColors.grey[50]),
    caption: TextStyle(
        fontSize: 12.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.grey[50]),
    overline: TextStyle(
        fontSize: 10.0,
        fontFamily: FontFamily.mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: AppColors.grey[50]),
  ),
  iconTheme: new IconThemeData(color: Colors.white),
  appBarTheme: new AppBarTheme(
    brightness: Brightness.dark,
    color: AppColors.mainColor[500],
    elevation: 16,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonColor: AppColors.mainColor[200],
  fontFamily: FontFamily.mainFont,
  brightness: Brightness.dark,
  primaryColor: AppColors.mainColor[500],
  backgroundColor: AppColors.mainColor[700],
  primarySwatch:
      MaterialColor(AppColors.mainColor[500]!.value, AppColors.mainColor),
  primaryColorBrightness: Brightness.dark,
  accentColor: AppColors.mainColor[500],
  accentColorBrightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.mainColor[800]!,
    secondary: AppColors.mainColor[600]!,
  ),
  // scaffoldBackgroundColor: Colors.transparent
);
