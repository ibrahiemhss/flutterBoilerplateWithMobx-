import 'package:flutter/material.dart';
import 'package:my_boilerplate/ui/chat/chat_screen.dart';
import 'package:my_boilerplate/ui/home/home.dart';
import 'package:my_boilerplate/ui/profile/profile_screen.dart';

class MainPageListBuildScreens {
  static MainPageListBuildScreens instance =
      new MainPageListBuildScreens.internal();

  MainPageListBuildScreens.internal();

  factory MainPageListBuildScreens() => instance;

  List<Widget> buildScreens(BuildContext context) {
    return [
      HomeScreen(),
      Center(child: Text("Demo")),
      ProfileScreen(),
      ChatScreen(),
      Center(child: Text("Demo")),
    ];
  }
}
