import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_boilerplate/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/firebase/firebase_messaging.dart';
import 'data/repository.dart';
import 'di/components/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Declaring fun to connect db and shared preferences.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ///Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await setPreferredOrientations();
  await configureInjection();

  Repository repository = getIt<Repository>();

  await repository.initializationFlutterLocalNotificationsPlugin();

  return runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
