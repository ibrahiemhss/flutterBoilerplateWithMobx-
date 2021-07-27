import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> mainColor = const <int, Color>{
    //#ea6952
    10: const Color(0xFFfeefea),
    25: const Color(0xFFfde0d8),
    50: const Color(0xFFfcd2c5),
    100: const Color(0xFFfac4b3),
    200: const Color(0xFFf9b5a0),
    300: const Color(0xFFf8a78e),
    400: const Color(0xFFf7997b),
    500: const Color(0xFFF68a69),
    600: const Color(0xFFea6952),
    700: const Color(0xFFF46e43),
    800: const Color(0xFFF35f31),
    900: const Color(0xFFF2511e)
  };

  static const Map<int, Color> grey = const <int, Color>{
    10: const Color(0xFFeeeeee),
    25: const Color(0xFFeeeeee),
    50: const Color(0xFFeeeeee),
    100: const Color(0xFFb4b4b4),
    200: const Color(0xFF999999),
    300: const Color(0xFF888888),
    400: const Color(0xFF707070),
    500: const Color(0xFF666666),
    600: const Color(0xFF555555),
    700: const Color(0xFF212738),
    800: const Color(0xFF212738),
    900: const Color(0xff282738)
  };

  static const Map<String, Color> backgroundColor = const <String, Color>{
    "Dark": Color(0xff212738),
    "Light": Color(0xfffafbfc)
  };
}
