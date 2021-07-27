import 'package:my_boilerplate/constants/colors.dart';
import 'package:my_boilerplate/constants/dimens.dart';
import 'package:my_boilerplate/stores/navigation/navigation_store.dart';
import 'package:my_boilerplate/stores/user/user_store.dart';
import 'package:my_boilerplate/stores/language/language_store.dart';
import 'package:my_boilerplate/stores/post/post_store.dart';
import 'package:my_boilerplate/stores/theme/theme_store.dart';
import 'package:my_boilerplate/utils/locale/app_localization.dart';
import 'package:my_boilerplate/widgets/handle_error_message_widget.dart';
import 'package:my_boilerplate/widgets/icons.dart';
import 'package:my_boilerplate/widgets/my_carousel_slider.dart';
import 'package:my_boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_boilerplate/widgets/rounded_widged.dart';
import 'package:my_boilerplate/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  //stores:---------------------------------------------------------------------
  late PostStore _postStore;
  late ThemeStore _themeStore;
  NavigationStore? _navigationStore;
  TabController? _tabController;

  GlobalKey<OverlayState> _overlayState = new GlobalKey<OverlayState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

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
    print("Here is Home screen");
    // _tabController = new TabController(length: 5, vsync: this);
    _tabController = TabController(vsync: this, length: tabs.length);

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
    _themeStore = Provider.of<ThemeStore>(context);
    _navigationStore = Provider.of<NavigationStore>(context);
    if (_navigationStore != null) {
      _navigationStore!.setPageAppBarTitle("home");
    }
    _postStore = Provider.of<PostStore>(context);
    // check to see if already called api
    if (!_postStore.loading) {
      _postStore.getPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _postStore.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: Container());
      },
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_postStore.errorStore.errorMessage.isNotEmpty) {
          return HandleWarnMessage.internal().HandleErrorMessage(
            context: context,
            title: _postStore.errorStore.errorTitle,
            errorMessage: _postStore.errorStore.errorMessage,
            isError: _postStore.errorStore.isError,
            themeStore: _themeStore,
          );
        }

        return SizedBox.shrink();
      },
    );
  }

  Widget mainContents() {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text(
                  _navigationStore!.pageAppBarTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColors.grey[50]),
                ),
                flexibleSpace: silverBarContents(),
                centerTitle: true,
                bottom: TabBar(
                  indicatorWeight: 3,
                  isScrollable: true,
                  unselectedLabelColor: AppColors.grey[100],
                  labelColor: AppColors.mainColor[700],
                  labelStyle: Theme.of(context).textTheme.headline5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.mainColor[700],
                  tabs: tabs,
                  controller: _tabController,
                ),
                backgroundColor: Colors.white,
                expandedHeight: Dimens.getScaledHeight(context, 0.47),
                floating: true,
                pinned: true,
                leading: IconButton(
                  icon: Icon(UiIcons.menuLeft),
                  color: Colors.white,
                  alignment: Alignment.centerRight,
                  tooltip: "",
                  onPressed: () {
                    try {
                      if (_scaffoldKey.currentState!.isDrawerOpen == false) {
                        _scaffoldKey.currentState!.openDrawer();
                      } else {
                        _scaffoldKey.currentState!.openEndDrawer();
                      }
                    } catch (e) {
                      print("catch e open darwer=${e.toString()}");
                    }
                  },
                ),
              )

              ///==============================================
            ];
          },

          //==============================================================================
          //==============================================================================
          //==============================================================================
          //==============================================================================
          //==============================================================================
          //==============================================================================

          body: TabBarView(controller: _tabController, children: <Widget>[
            Text("tape1"),
            Text("tape2"),
            Text("tape3"),
            Text("tape1"),
            Text("tape2"),
            Text("tape3"),
            Text("tape1"),
            Text("tape2"),
            Text("tape3"),
          ]),
          //==============================================================================
          //==============================================================================
          //==============================================================================
          //==============================================================================
          //==============================================================================
          //==============================================================================
        ),
      ),
    );
  }

  TextEditingController _searchController = TextEditingController();

  Widget silverBarContents() {
    return Container(
      alignment: Alignment.center,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            //==================================================================
            //==========================section 1 stack contents================
            //==================================================================
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight,
                  ),
                  //------------------[ Positioned : 1 ]----------------
                  //widget contents all other widgets inside silver bar
                  //----------------------------------------------------
                  Positioned(
                    top: 0,
                    child: Container(
                      height: Dimens.getScaledHeight(context, 0.15),
                      width: Dimens.screenWidth(context),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor[700],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                    ),
                  ),
                  //------------------[ Positioned : 2 ]----------------
                  //--------------------Bell Icon-----------------------
                  //----------------------------------------------------
                  Positioned(
                    top: Dimens.getScaledHeight(context, 0.025),
                    //bottom: 10,
                    left: Dimens.getScaledWidth(context, 0.05),
                    height: Dimens.getScaledWidth(context, 0.099),
                    width: Dimens.getScaledWidth(context, 0.099),
                    child: Icon(
                      UiIcons.bell,
                      color: Colors.white,
                      size: Dimens.getScaledWidth(context, 0.080),
                    ),
                  ),
                  //------------------[ Positioned : 1 ]----------------
                  //------------circle shape beside the bell------------
                  //----------------------------------------------------
                  Positioned(
                    top: Dimens.getScaledHeight(context, 0.060),
                    //bottom: 10,
                    left: Dimens.getScaledWidth(context, 0.110),
                    height: Dimens.getScaledWidth(context, 0.030),
                    width: Dimens.getScaledWidth(context, 0.030),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  //----------------------------------------------------
                  //---------widget content search and filter widgets---
                  //----------------------------------------------------
                  Positioned(
                    top: Dimens.getScaledHeight(context, 0.10),
                    left: 1,
                    right: 1,
                    child: Container(
                      height: Dimens.getScaledHeight(context, 0.085),
                      //     width: Dimens.getScaledWidth(context, 0.001),
                      //color: AppColors.grey[700],
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Dimens.getScaledWidth(context, 0.7),
                            height: Dimens.getScaledHeight(context, 0.8),
                            child: Card(
                              elevation: 12,
                              child: Row(
                                //mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AspectRatio(
                                      aspectRatio: 0.5,
                                      child: Icon(
                                        UiIcons.search,
                                        color: AppColors.grey[200],
                                      )),
                                  AspectRatio(
                                      aspectRatio: 3.0,
                                      child: Center(
                                          child: _buildInputSearchField())),
                                  AspectRatio(
                                      aspectRatio: 0.5,
                                      child: Icon(
                                        UiIcons.filter,
                                        color: AppColors.mainColor[700],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: Dimens.getScaledWidth(context, 0.2),
                            height: Dimens.getScaledHeight(context, 0.15),
                            child: Card(
                              color: Colors.white,
                              elevation: 12,
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Icon(
                                    UiIcons.locationOutLine,
                                    color: AppColors.mainColor[700],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //----------------------------------------------------
                  //---------search accepted values  -------------------
                  //----------------------------------------------------
                  Positioned(
                    top: Dimens.getScaledHeight(context, 0.20),
                    right: 8,
                    left: 8,
                    child: Container(
                      color: Colors.blueGrey,
                      height: Dimens.getScaledHeight(context, 0.20),
                      width: Dimens.getScaledWidth(context, 0.01),
                      child: CarouselWithIndicator(),
                    ),
                  ),
                ],
              ),
              //==================================================================
              //====================section 2 list search contents================
              //==================================================================
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInputSearchField() {
    return Container(
      margin: EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
      width: Dimens.getScaledHeight(context, 0.8),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormFieldWidget(
                    padding: EdgeInsets.only(right: 4.0, top: 2.0, bottom: 2.0),
                    hint: "",
                    maxLines: 4,
                    maxLength: 200,
                    borderColor: Colors.transparent,
                    //focusColor: AppColors.mainColor[900],
                    inputType: TextInputType.multiline,
                    //icon: UiIcons.search,
                    hintColor: AppColors.grey[300]!,
                    iconColor: _themeStore.darkMode
                        ? Colors.white70
                        : AppColors.grey[300]!,
                    textController: _searchController,
                    inputAction: TextInputAction.done,
                    autoFocus: false,
                    onChanged: (value) {
                      //_store.setUserId(_userEmailController.text);
                    },
                    onFieldSubmitted: (value) {
                      //FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    //  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchListView() {
    return _postStore.postList != null
        ? ListView.separated(
            itemCount: _postStore.postList!.posts!.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return _buildListItem(position);
            },
          )
        : Center(
            child: Text(
              AppLocalizations.of(context).translate('noDatafound'),
            ),
          );
  }

  Widget _buildListItem(int position) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.cloud_circle),
      title: Text(
        '${_postStore.postList?.posts?[position].title}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        '${_postStore.postList?.posts?[position].body}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }
}
