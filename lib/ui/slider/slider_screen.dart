import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_boilerplate/constants/dimens.dart';
import 'package:my_boilerplate/stores/language/language_store.dart';
import 'package:my_boilerplate/stores/navigation/navigation_store.dart';
import 'package:my_boilerplate/stores/user/user_store.dart';
import 'package:my_boilerplate/utils/locale/language_actions.dart';
import 'package:my_boilerplate/utils/routes/routes.dart';
import 'package:my_boilerplate/widgets/icons.dart';
import 'package:provider/provider.dart';
import 'package:my_boilerplate/constants/colors.dart';
import 'package:my_boilerplate/models/slider/slider_model.dart';
import 'package:my_boilerplate/utils/locale/app_localization.dart';
import 'package:my_boilerplate/widgets/progress_indicator_widget.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<SliderModel> _mySlides = [];
  PageController? _controller;
  NavigationStore? _navigationStore;
  UserStore? _userStore;
  LanguageStore? _languageStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _navigationStore = Provider.of<NavigationStore>(context);
    _userStore = Provider.of<UserStore>(context);
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? Dimens.screenWidth(context) / 55
          : Dimens.screenHeight(context) / 55,
      width: MediaQuery.of(context).orientation == Orientation.landscape
          ? Dimens.screenWidth(context) / 55
          : Dimens.screenHeight(context) / 55,
      decoration: BoxDecoration(
        border: Border.all(
            color: isCurrentPage ? AppColors.mainColor[700]! : Colors.grey),
        color: isCurrentPage ? AppColors.mainColor[900]! : Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(50.0) //                 <--- border radius here
            ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _mySlides = getSlides();
    _controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainContent(context),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Observer(
      builder: (context) {
        return _navigationStore! == null
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildView(context));
      },
    );
  }

  Widget _buildView(BuildContext context) {
    return /*Scaffold(
      body: Container(
        decoration: BoxDecorations.screensBoxDecoration(
            isDark: _themeStore!.darkMode ? true : false),
        child: */
        Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        body: Container(
          child: Flex(
            direction: Axis.vertical,
            //shrinkWrap: true,
            children: [
              skipWidget(),
              Expanded(
                child: Container(
                  height: Dimens.screenHeight(context) - 100,
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      _navigationStore!.setSlideIndex(index);
                    },
                    children: <Widget>[
                      SlideTile(
                        imagePath: _mySlides[0].getImageAssetPath(),
                        title: _mySlides[0].getTitle(),
                        desc: _mySlides[0].getDesc(),
                      ),
                      SlideTile(
                        imagePath: _mySlides[1].getImageAssetPath(),
                        title: _mySlides[1].getTitle(),
                        desc: _mySlides[1].getDesc(),
                      ),
                      SlideTile(
                        imagePath: _mySlides[2].getImageAssetPath(),
                        title: _mySlides[2].getTitle(),
                        desc: _mySlides[2].getDesc(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      i == _navigationStore!.getSlideIndex
                          ? _buildPageIndicator(false)
                          : _buildPageIndicator(true),
                  ],
                ),
              ),
              nextWidget()
            ],
          ),
        ),
        // ),
        //),
      ),
    );
  }

  Widget skipWidget() {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "${LanguageActions.instance.changToCurrentLanguageNumber((_navigationStore!.getSlideIndex + 1).toString(), _languageStore!.locale)} / ${AppLocalizations.of(context).translate('threeNum')}",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: AppColors.grey[300]),
          ),
          TextButton(
            onPressed: () {
              _controller!.animateToPage(2,
                  duration: Duration(milliseconds: 400), curve: Curves.linear);
            },
            // splashColor: Colors.cyanAccent,
            child: Text(
              AppLocalizations.of(context).translate('skip'),
              //////
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }

  Widget nextWidget() {
    return Center(
      //color: Colors.amber,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  await _controller!.animateToPage(
                      _navigationStore!.getSlideIndex - 1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear);
                },
                child: SizedBox(
                  width: Dimens.screenWidth(context) / 6,
                  child: _navigationStore!.getSlideIndex > 0
                      ? Icon(Icons.arrow_back_ios)
                      : Container(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_navigationStore!.getSlideIndex != 2) {
                    _controller!.animateToPage(
                        _navigationStore!.getSlideIndex + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                  } else {
                    await gooScreen(context);
                  }
                },
                child: Container(
                  width: Dimens.screenWidth(context) / 3,
                  child: Center(
                    child: Text(
                      _navigationStore!.getSlideIndex > 0 &&
                              _navigationStore!.getSlideIndex != 2
                          ? AppLocalizations.of(context).translate('previous')
                          : _navigationStore!.getSlideIndex != 2
                              ? AppLocalizations.of(context).translate('next')
                              : AppLocalizations.of(context)
                                  .translate('letsBegin'),
                      //////
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_navigationStore!.getSlideIndex == 2) {
                    await gooScreen(context);
                  } else {
                    _controller!.animateToPage(
                        _navigationStore!.getSlideIndex + 1,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear);
                  }
                },
                child: SizedBox(
                  width: Dimens.screenWidth(context) / 6,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> gooScreen(BuildContext context) async {
    _navigationStore!.changeFirstEntry(false);
    Navigator.of(context).pushReplacementNamed(Routes.main);
    /* if (_userStore!.isLoggedIn) {
      Navigator.of(context).pushReplacementNamed(Routes.main);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }*/
  }
}

class SlideTile extends StatelessWidget {
  final String? imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Center(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection:
            MediaQuery.of(context).orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.vertical,

        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? Dimens.screenWidth(context) / 8
                        : 0.0),
            child: Image.asset(imagePath!,
                height: Dimens.screenWidth(context) / 1.5),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? Dimens.screenWidth(context) / 8
                        : 0.0),
            child: descTexts(context),
          )
        ],
      ),
    );
  }

  Widget descTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Center(
            child: Text(
              AppLocalizations.of(context).translate(title!),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).orientation == Orientation.landscape
              ? Dimens.screenWidth(context) / 1.6
              : Dimens.screenWidth(context) / 1.2,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              AppLocalizations.of(context).translate(desc!),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        )
      ],
    );
  }
}
