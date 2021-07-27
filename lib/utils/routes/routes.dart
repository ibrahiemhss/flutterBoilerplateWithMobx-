import 'package:my_boilerplate/ui/auth/login.dart';
import 'package:my_boilerplate/ui/auth/register.dart';
import 'package:my_boilerplate/ui/home/home.dart';
import 'package:my_boilerplate/ui/mainPages/main_pages_screen.dart';
import 'package:my_boilerplate/ui/profile/profile_screen.dart';
import 'package:my_boilerplate/ui/slider/slider_screen.dart';
import 'package:my_boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String slider = '/slider';
  //static const String entry = '/entry';
  static const String splash = '/splash';
  static const String main = '/main';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String home = '/home';
  static const String chat = '/chat';
  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    slider: (BuildContext context) => SliderScreen(),
    //entry: (BuildContext context) => EntryScreen(),
    main: (BuildContext context) => MainPageScreen(),
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    register: (BuildContext context) => RegisterScreen(),
    home: (BuildContext context) => HomeScreen(),
    profile: (BuildContext context) => ProfileScreen(),
  };
}
