// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationStore on navigationStore, Store {
  Computed<bool>? _$initdRiveArtboardComputed;

  @override
  bool get initdRiveArtboard => (_$initdRiveArtboardComputed ??= Computed<bool>(
          () => super.initdRiveArtboard,
          name: 'navigationStore.initdRiveArtboard'))
      .value;
  Computed<int>? _$pageIndexComputed;

  @override
  int get pageIndex =>
      (_$pageIndexComputed ??= Computed<int>(() => super.pageIndex,
              name: 'navigationStore.pageIndex'))
          .value;
  Computed<bool>? _$isRiveAnimationPlayingComputed;

  @override
  bool get isRiveAnimationPlaying => (_$isRiveAnimationPlayingComputed ??=
          Computed<bool>(() => super.isRiveAnimationPlaying,
              name: 'navigationStore.isRiveAnimationPlaying'))
      .value;
  Computed<Artboard>? _$riveArtboardComputed;

  @override
  Artboard get riveArtboard =>
      (_$riveArtboardComputed ??= Computed<Artboard>(() => super.riveArtboard,
              name: 'navigationStore.riveArtboard'))
          .value;
  Computed<RiveAnimationController<dynamic>?>?
      _$riveAnimationControllerComputed;

  @override
  RiveAnimationController<dynamic>? get riveAnimationController =>
      (_$riveAnimationControllerComputed ??=
              Computed<RiveAnimationController<dynamic>?>(
                  () => super.riveAnimationController,
                  name: 'navigationStore.riveAnimationController'))
          .value;
  Computed<int>? _$drawerIndexComputed;

  @override
  int get drawerIndex =>
      (_$drawerIndexComputed ??= Computed<int>(() => super.drawerIndex,
              name: 'navigationStore.drawerIndex'))
          .value;
  Computed<String>? _$routeComputed;

  @override
  String get route => (_$routeComputed ??=
          Computed<String>(() => super.route, name: 'navigationStore.route'))
      .value;
  Computed<String>? _$pageAppBarTitleComputed;

  @override
  String get pageAppBarTitle => (_$pageAppBarTitleComputed ??= Computed<String>(
          () => super.pageAppBarTitle,
          name: 'navigationStore.pageAppBarTitle'))
      .value;
  Computed<Widget>? _$screenComputed;

  @override
  Widget get screen => (_$screenComputed ??=
          Computed<Widget>(() => super.screen, name: 'navigationStore.screen'))
      .value;
  Computed<int>? _$getSlideIndexComputed;

  @override
  int get getSlideIndex =>
      (_$getSlideIndexComputed ??= Computed<int>(() => super.getSlideIndex,
              name: 'navigationStore.getSlideIndex'))
          .value;
  Computed<bool>? _$isFirstEntryComputed;

  @override
  bool get isFirstEntry =>
      (_$isFirstEntryComputed ??= Computed<bool>(() => super.isFirstEntry,
              name: 'navigationStore.isFirstEntry'))
          .value;
  Computed<int>? _$getUserTypeComputed;

  @override
  int get getUserType =>
      (_$getUserTypeComputed ??= Computed<int>(() => super.getUserType,
              name: 'navigationStore.getUserType'))
          .value;

  final _$_initdRiveArtboardAtom =
      Atom(name: 'navigationStore._initdRiveArtboard');

  @override
  bool get _initdRiveArtboard {
    _$_initdRiveArtboardAtom.reportRead();
    return super._initdRiveArtboard;
  }

  @override
  set _initdRiveArtboard(bool value) {
    _$_initdRiveArtboardAtom.reportWrite(value, super._initdRiveArtboard, () {
      super._initdRiveArtboard = value;
    });
  }

  final _$_riveArtboardAtom = Atom(name: 'navigationStore._riveArtboard');

  @override
  Artboard? get _riveArtboard {
    _$_riveArtboardAtom.reportRead();
    return super._riveArtboard;
  }

  @override
  set _riveArtboard(Artboard? value) {
    _$_riveArtboardAtom.reportWrite(value, super._riveArtboard, () {
      super._riveArtboard = value;
    });
  }

  final _$_riveAnimationControllerAtom =
      Atom(name: 'navigationStore._riveAnimationController');

  @override
  RiveAnimationController<dynamic>? get _riveAnimationController {
    _$_riveAnimationControllerAtom.reportRead();
    return super._riveAnimationController;
  }

  @override
  set _riveAnimationController(RiveAnimationController<dynamic>? value) {
    _$_riveAnimationControllerAtom
        .reportWrite(value, super._riveAnimationController, () {
      super._riveAnimationController = value;
    });
  }

  final _$_isRiveAnimationPlayingAtom =
      Atom(name: 'navigationStore._isRiveAnimationPlaying');

  @override
  bool get _isRiveAnimationPlaying {
    _$_isRiveAnimationPlayingAtom.reportRead();
    return super._isRiveAnimationPlaying;
  }

  @override
  set _isRiveAnimationPlaying(bool value) {
    _$_isRiveAnimationPlayingAtom
        .reportWrite(value, super._isRiveAnimationPlaying, () {
      super._isRiveAnimationPlaying = value;
    });
  }

  final _$_pageIndexAtom = Atom(name: 'navigationStore._pageIndex');

  @override
  int get _pageIndex {
    _$_pageIndexAtom.reportRead();
    return super._pageIndex;
  }

  @override
  set _pageIndex(int value) {
    _$_pageIndexAtom.reportWrite(value, super._pageIndex, () {
      super._pageIndex = value;
    });
  }

  final _$_drawerIndexAtom = Atom(name: 'navigationStore._drawerIndex');

  @override
  int get _drawerIndex {
    _$_drawerIndexAtom.reportRead();
    return super._drawerIndex;
  }

  @override
  set _drawerIndex(int value) {
    _$_drawerIndexAtom.reportWrite(value, super._drawerIndex, () {
      super._drawerIndex = value;
    });
  }

  final _$_pageAppBarTitleAtom = Atom(name: 'navigationStore._pageAppBarTitle');

  @override
  String get _pageAppBarTitle {
    _$_pageAppBarTitleAtom.reportRead();
    return super._pageAppBarTitle;
  }

  @override
  set _pageAppBarTitle(String value) {
    _$_pageAppBarTitleAtom.reportWrite(value, super._pageAppBarTitle, () {
      super._pageAppBarTitle = value;
    });
  }

  final _$_routeAtom = Atom(name: 'navigationStore._route');

  @override
  String get _route {
    _$_routeAtom.reportRead();
    return super._route;
  }

  @override
  set _route(String value) {
    _$_routeAtom.reportWrite(value, super._route, () {
      super._route = value;
    });
  }

  final _$_screenAtom = Atom(name: 'navigationStore._screen');

  @override
  Widget get _screen {
    _$_screenAtom.reportRead();
    return super._screen;
  }

  @override
  set _screen(Widget value) {
    _$_screenAtom.reportWrite(value, super._screen, () {
      super._screen = value;
    });
  }

  final _$_slideIndexAtom = Atom(name: 'navigationStore._slideIndex');

  @override
  int get _slideIndex {
    _$_slideIndexAtom.reportRead();
    return super._slideIndex;
  }

  @override
  set _slideIndex(int value) {
    _$_slideIndexAtom.reportWrite(value, super._slideIndex, () {
      super._slideIndex = value;
    });
  }

  final _$_isFirstEntryAtom = Atom(name: 'navigationStore._isFirstEntry');

  @override
  bool get _isFirstEntry {
    _$_isFirstEntryAtom.reportRead();
    return super._isFirstEntry;
  }

  @override
  set _isFirstEntry(bool value) {
    _$_isFirstEntryAtom.reportWrite(value, super._isFirstEntry, () {
      super._isFirstEntry = value;
    });
  }

  final _$_userTypeAtom = Atom(name: 'navigationStore._userType');

  @override
  int get _userType {
    _$_userTypeAtom.reportRead();
    return super._userType;
  }

  @override
  set _userType(int value) {
    _$_userTypeAtom.reportWrite(value, super._userType, () {
      super._userType = value;
    });
  }

  final _$loadingAtom = Atom(name: 'navigationStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$navigationStoreActionController =
      ActionController(name: 'navigationStore');

  @override
  void indexIfNull(int value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.indexIfNull');
    try {
      return super.indexIfNull(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRiveArtboard(Artboard value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setRiveArtboard');
    try {
      return super.setRiveArtboard(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRiveAnimationController(RiveAnimationController<dynamic> value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setRiveAnimationController');
    try {
      return super.setRiveAnimationController(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRiveAnimationPlaying() {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setRiveAnimationPlaying');
    try {
      return super.setRiveAnimationPlaying();
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleRivePlay() {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.toggleRivePlay');
    try {
      return super.toggleRivePlay();
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageIndex(int value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setPageIndex');
    try {
      return super.setPageIndex(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDrawerIndex(int value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setDrawerIndex');
    try {
      return super.setDrawerIndex(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageAppBarTitle(String value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setPageAppBarTitle');
    try {
      return super.setPageAppBarTitle(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRoute(String value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setRoute');
    try {
      return super.setRoute(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScreen(Widget value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setScreen');
    try {
      return super.setScreen(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSlideIndex(int value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.setSlideIndex');
    try {
      return super.setSlideIndex(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFirstEntry(bool value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.changeFirstEntry');
    try {
      return super.changeFirstEntry(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeUserType(int value) {
    final _$actionInfo = _$navigationStoreActionController.startAction(
        name: 'navigationStore.changeUserType');
    try {
      return super.changeUserType(value);
    } finally {
      _$navigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
initdRiveArtboard: ${initdRiveArtboard},
pageIndex: ${pageIndex},
isRiveAnimationPlaying: ${isRiveAnimationPlaying},
riveArtboard: ${riveArtboard},
riveAnimationController: ${riveAnimationController},
drawerIndex: ${drawerIndex},
route: ${route},
pageAppBarTitle: ${pageAppBarTitle},
screen: ${screen},
getSlideIndex: ${getSlideIndex},
isFirstEntry: ${isFirstEntry},
getUserType: ${getUserType}
    ''';
  }
}
