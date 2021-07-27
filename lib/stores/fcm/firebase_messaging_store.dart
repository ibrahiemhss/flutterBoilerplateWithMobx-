import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_boilerplate/models/notifications/received_notification.dart';
import 'package:my_boilerplate/widgets/notifications_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:my_boilerplate/data/repository.dart';
import 'package:my_boilerplate/models/notifications/fcm_notification_model.dart';
import 'package:my_boilerplate/stores/error/error_store.dart';

part 'firebase_messaging_store.g.dart';

class FirebaseMessagingStore = _FirebaseMessagingStore
    with _$FirebaseMessagingStore;

/// Define a top-level named handler which background/terminated messages will
/// call.
/// To verify things are working, check out the native platform logs.
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

abstract class _FirebaseMessagingStore with Store {
  // repository instance
  final Repository _repository;
  _FirebaseMessagingStore(Repository repository)
      : this._repository = repository {}

  // store variables:-----------------------------------------------------------
  static ObservableFuture<FcmMessage> emptyMessageResponse =
      ObservableFuture<FcmMessage>.value(new FcmMessage());

  @observable
  ObservableFuture<FcmMessage> fetchMessageFuture =
      ObservableFuture<FcmMessage>(emptyMessageResponse);

  @observable
  ObservableFuture<String> sendMessageFuture =
      ObservableFuture<String>.value("");
  @observable
  FcmMessage? _fcmMessage;

  @computed
  bool get loading => sendMessageFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @computed
  FcmMessage get fcmMessage => _fcmMessage!;

  /* @action
  Future<void> initializationSettingsIOS() async {
    // if (_repository.initializationSettingsIOS() != null) {
    final future = ObservableFuture<ReceivedNotification>.value(
        _repository.initializationSettingsIOS()!);
    didReceiveLocalNotificationSubject = ObservableFuture(future);
    // }
  }

  Future<void> initializationNotificationSettings() async {
    // if (_repository.initializationNotificationSettings() != null) {

    final future = ObservableFuture<String>.value(
        _repository.initializationNotificationSettings());
    selectNotificationSubject = ObservableFuture(future);

    future.then((value) {
      print(
          "================LocalNotificationsPlugin   initialize =======:\n ${value}");
    }).catchError((error) {
      //errorStore.errorMessage = DioErrorUtil.handleError(error);
    });

    // }
  }
*/
  Future sendAndRetrieveMessage(FcmMessage fcmMessage) async {
    final future = _repository.sendNotification(fcmMessage);
    sendMessageFuture = ObservableFuture(future);

    future.then((message) {
      print(
          "================sendAndRetrieveMessage====ChangeRouteScreen=======:\n ${message}");
    }).catchError((error) {
      //errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
