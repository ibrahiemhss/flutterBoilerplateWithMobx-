import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:my_boilerplate/constants/colors.dart';
import 'package:my_boilerplate/stores/navigation/navigation_store.dart';
import 'package:my_boilerplate/stores/theme/theme_store.dart';
import 'package:my_boilerplate/ui/chat/chat_screen.dart';
import 'package:my_boilerplate/ui/home/home.dart';
import 'package:my_boilerplate/ui/profile/profile_screen.dart';
import 'package:my_boilerplate/utils/routes/routes.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'icons.dart';

class BottomNavBarItem {
  static BottomNavBarItem instance = new BottomNavBarItem.internal();
  BottomNavBarItem.internal();

  List<PersistentBottomNavBarItem> navBarsItems(
      {ThemeStore? themeStore, required NavigationStore navigationStore}) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(MaterialIcons.home),
        title: "Home",
        activeColorPrimary: AppColors.mainColor[700]!,
        inactiveColorPrimary: AppColors.grey[300]!,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(MaterialIcons.favorite),
        title: ("Favorite"),
        activeColorPrimary: AppColors.mainColor[700]!,
        inactiveColorPrimary: AppColors.grey[300]!,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
        ),
        /* onPressed: (context) {
            navigationStore.setScreen(HomeScreen());
            navigationStore.setPageAppBarTitle("home");
          }*/
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: ("Add your ad"),
        activeColorPrimary: AppColors.mainColor[700]!,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: AppColors.grey[300]!,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            Routes.profile: (context) => ProfileScreen(),
            Routes.home: (context) => HomeScreen(),
          },
        ),
        /* onPressed: (context) {
            pushDynamicScreen(context,
                screen: SampleModalScreen(), withNavBar: true);
          }*/
      ),
      PersistentBottomNavBarItem(
        icon: Icon(MaterialIcons.chat),
        title: ("Messages"),
        activeColorPrimary: AppColors.mainColor[700]!,
        inactiveColorPrimary: AppColors.grey[300]!,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            Routes.chat: (context) => ChatScreen(),
            Routes.home: (context) => HomeScreen(),
          },
        ),
        /* onPressed: (context) {
            navigationStore.setScreen(ChatScreen());
            navigationStore.setPageAppBarTitle("chat");
          }*/
      ),
      PersistentBottomNavBarItem(
        icon: Icon(MaterialIcons.account_circle),
        title: ("My account"),
        activeColorPrimary: AppColors.mainColor[700]!,
        inactiveColorPrimary: AppColors.grey[300]!,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            Routes.profile: (context) => ProfileScreen(),
            Routes.home: (context) => HomeScreen(),
          },
        ),
        /*onPressed: (context) {
            navigationStore.setScreen(ProfileScreen());
            navigationStore.setPageAppBarTitle("myAccount");
          }*/
      ),
    ];
  }
}
