import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_boilerplate/data/firebase/firebase_messaging.dart';
import 'package:my_boilerplate/ui/auth/login.dart';
import 'package:my_boilerplate/ui/mainPages/main_pages_screen.dart';
import 'package:my_boilerplate/ui/slider/slider_screen.dart';
import 'package:my_boilerplate/utils/builder/notifications.dart';
import 'package:my_boilerplate/widgets/notifications_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_boilerplate/constants/assets.dart';
import 'package:my_boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:my_boilerplate/models/notifications/fcm_notification_model.dart';
import 'package:my_boilerplate/stores/fcm/firebase_messaging_store.dart';
import 'package:my_boilerplate/stores/navigation/navigation_store.dart';
import 'package:my_boilerplate/stores/user/user_store.dart';
import 'package:my_boilerplate/utils/router/previous_route_observer.dart';
import 'package:my_boilerplate/utils/routes/routes.dart';
import 'package:my_boilerplate/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteAwareWidget extends StatefulWidget {
  final String name;
  final Widget? child;

  RouteAwareWidget(this.name, {@required this.child});

  @override
  State<RouteAwareWidget> createState() => _RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class _RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
        this, MaterialPageRoute(builder: (context) => SplashScreen()));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  // Called when the current route has been pushed.
  void didPush() {
    // print('didPush ${widget.name}');
  }

  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    print('didPopNext ${widget.name}');
  }

  @override
  Widget build(BuildContext context) => widget.child!;
}

// here is declare all actions wants to do before enter app
class SplashScreen extends StatefulWidget with WidgetsBindingObserver {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// Toggles playing/pausing the animation

  FirebaseMessagingStore? _firebaseMessagingStore;
  UserStore? _userStore;
  NavigationStore? _navigationStore;

  @override
  void didChangeDependencies() {
    _firebaseMessagingStore = Provider.of<FirebaseMessagingStore>(context);
    _userStore = Provider.of<UserStore>(context);
    _navigationStore = Provider.of<NavigationStore>(context);
    if (_navigationStore != null) {
      rootBundle.load(Assets.splashAnim).then(
        (data) async {
          // Load the RiveFile from the binary data.
          final file = RiveFile.import(data);
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_navigationStore!.riveAnimationController!);
          _navigationStore!.setRiveArtboard(artboard);
        },
      );
    }
    if (_userStore != null) {
      _userStore!.getUserData();
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.

    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(context, Routes.main,
            arguments: FcmMessage.fromJson(message.data));
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        NotificationsBuilder.instance.showInboxNotification(
            header: "show test",
            title: notification.title!,
            body: notification.body!,
            inboxChannelId: channel!.id,
            inboxChannelName: channel!.name,
            inboxChannelDescription: channel!.description);

        // NotificationsBuilder.instance.showMessagingNotification();
        // NotificationsBuilder.instance.showNotificationWithTag();
        // NotificationsBuilder.instance.showNotification();
        //NotificationsBuilder.instance.showFullScreenNotification(context);
        //.notify(title: notification.title!, body: notification.body!);
        /*    _firebaseMessagingStore!.flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                _firebaseMessagingStore!.channel.id,
                _firebaseMessagingStore!.channel.name,
                _firebaseMessagingStore!.channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                //icon: Assets.logo,
              ),
            ));*/

        //NotificationsBuilder.instance.showGroupedNotifications();
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(context, Routes.main,
          arguments: FcmMessage.fromJson(message!.data));
    });

    // startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return _navigationStore!.isFirstEntry
        ? SliderScreen()
        : // _userStore!.isLoggedIn
        // ?
        MainPageScreen();
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    if (_navigationStore!.isFirstEntry) {
      Navigator.of(context).pushReplacementNamed(Routes.slider);
      // }// else if (_userStore!.isLoggedIn) {
      // Navigator.of(context).pushReplacementNamed(Routes.main);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.main);
    }
  }
}
