import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:my_boilerplate/constants/colors.dart';
import 'package:my_boilerplate/stores/post/post_store.dart';
import 'package:my_boilerplate/stores/user/user_store.dart';
import 'package:my_boilerplate/utils/locale/app_localization.dart';
import 'package:my_boilerplate/utils/routes/routes.dart';
import 'package:my_boilerplate/widgets/bas_app_bar.dart';
import 'package:my_boilerplate/widgets/bottom_nav_barItem.dart';
import 'package:my_boilerplate/widgets/handle_error_message_widget.dart';
import 'package:my_boilerplate/widgets/main_list_build_screen.dart';
import 'package:my_boilerplate/widgets/progress_indicator_widget.dart';
import 'package:my_boilerplate/widgets/rounded_widged.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:my_boilerplate/constants/box_decorations.dart';
import 'package:my_boilerplate/constants/dimens.dart';
import 'package:my_boilerplate/stores/language/language_store.dart';
import 'package:my_boilerplate/stores/navigation/navigation_store.dart';
import 'package:my_boilerplate/stores/theme/theme_store.dart';

import 'drawer_items.dart';

class MainPageScreen extends StatefulWidget {
  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen>
    with TickerProviderStateMixin {
  PersistentTabController? _controller;
  bool? _hideNavBar;
  //stores:---------------------------------------------------------------------
  NavigationStore? _navigationStore;
  ThemeStore? _themeStore;
  LanguageStore? _languageStore;
  UserStore? _userDataStore;
  late PostStore _postStore;

  List<Tab> tabs = <Tab>[
    Tab(
      // icon: Icon(Icons.circle),
      //text: "tt",
      child: RoundedWidget(
        text: "الكل",
      ),
    ),
    /*  child: PhysicalModel(
            color: Colors.white,
            elevation: 15.0,
            shape: BoxShape.circle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "All",
              ),
            )))*/

    new Tab(text: "سيارات"),
    new Tab(text: "عقارات"),
    new Tab(text: "شركات"),
    new Tab(text: "رياضه"),
    new Tab(text: "33333"),
    new Tab(text: "11111"),
    new Tab(text: "2222"),
    new Tab(text: "33333"),
  ];
  @override
  void initState() {
    print("Here is main screen");
    // _tabController = new TabController(length: 5, vsync: this);
    _controller = PersistentTabController(initialIndex: 0);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _navigationStore!.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
    _navigationStore = Provider.of<NavigationStore>(context);
    _userDataStore = Provider.of<UserStore>(context);
    if (_navigationStore != null) {
      _navigationStore!.setPageAppBarTitle("home");
    }
    _postStore = Provider.of<PostStore>(context);
    // check to see if already called api
    if (!_postStore.loading) {
      _postStore.getPosts();
    }
  }

  GlobalKey<OverlayState> _overlayState = GlobalKey<OverlayState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return _postStore.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildView(context));
      },
    );
  }

  Widget _buildView(BuildContext context) {
    return _postStore.loading
        ? CustomProgressIndicatorWidget()
        : Scaffold(
            key: _scaffoldKey,
            appBar: BasAppBar(
              title: _navigationStore!.pageAppBarTitle,
              appBar: AppBar(),
              overlayState: _overlayState,
              themeStore: _themeStore!,
              languageStore: _languageStore!,
              leading: Builder(
                  builder: (context) => IconButton(
                      icon: new Icon(MaterialIcons.menu),
                      onPressed: () {
                        try {
                          if (_scaffoldKey.currentState!.isDrawerOpen ==
                              false) {
                            _scaffoldKey.currentState!.openDrawer();
                          } else {
                            _scaffoldKey.currentState!.openEndDrawer();
                          }
                        } catch (e) {
                          print("catch e open darwer=${e.toString()}");
                        }
                      })),
            ),
            body: mainContents(context),
            drawer: Container(
              decoration: BoxDecorations.screensBoxDecoration(
                  isDark: _themeStore!.darkMode ? true : false),
              child: Container(
                  margin: const EdgeInsets.only(top: Dimens.horizontal_padding),
                  width: Dimens.getScaledWidth(context, 0.7),
                  child: Observer(builder: (context) {
                    return ListView(
                        shrinkWrap: true,
                        children: DrawerItems(
                            userDataStore: _userDataStore,
                            overlayState: _overlayState,
                            context: context,
                            selectedIndex: _navigationStore!.drawerIndex,
                            onpress: (
                                {Widget? screen,
                                String? screenTitle,
                                int? index}) {
                              if (screen != null) {
                                try {
                                  //if (_overlayState.currentContext != null) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      Routes.main,
                                      (Route<dynamic> route) => false);
                                  // }
                                } catch (e) {}
                              }
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                _navigationStore!.setDrawerIndex(index!);
                                if (screen != null) {
                                  _navigationStore!.setScreen(screen);
                                }
                                if (screenTitle != null) {
                                  _navigationStore!
                                      .setPageAppBarTitle(screenTitle);
                                }
                              });
                            },
                            themeStore: _themeStore!,
                            languageStore: _languageStore!,
                            navigationStore: _navigationStore!));
                  })),
            ),
          );
  }

  Widget mainContents(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: MainPageListBuildScreens.instance.buildScreens(context),
      items: BottomNavBarItem.instance
          .navBarsItems(navigationStore: _navigationStore!),
      confineInSafeArea: true,
      backgroundColor: AppColors.mainColor[10]!.withOpacity(0.5),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      hideNavigationBarWhenKeyboardShows: true,

      margin: EdgeInsets.all(0.0),
      popActionScreens: PopActionScreensType.all,
      bottomScreenMargin: 0.0,
      onWillPop: (ctx) async {
        await showDialog(
          context: ctx!,
          useSafeArea: true,
          builder: (context) => Container(
            height: 50.0,
            width: 50.0,
            color: Colors.white,
            child: ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
        return false;
      },
      selectedTabScreenContext: (context) {},
      hideNavigationBar: _hideNavBar,
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.indigo,
          borderRadius: BorderRadius.circular(20.0)),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property
    );
  }
}
