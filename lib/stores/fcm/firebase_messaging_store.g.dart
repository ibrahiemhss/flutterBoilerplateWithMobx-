// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_messaging_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseMessagingStore on _FirebaseMessagingStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_FirebaseMessagingStore.loading'))
      .value;
  Computed<FcmMessage>? _$fcmMessageComputed;

  @override
  FcmMessage get fcmMessage =>
      (_$fcmMessageComputed ??= Computed<FcmMessage>(() => super.fcmMessage,
              name: '_FirebaseMessagingStore.fcmMessage'))
          .value;

  final _$fetchMessageFutureAtom =
      Atom(name: '_FirebaseMessagingStore.fetchMessageFuture');

  @override
  ObservableFuture<FcmMessage> get fetchMessageFuture {
    _$fetchMessageFutureAtom.reportRead();
    return super.fetchMessageFuture;
  }

  @override
  set fetchMessageFuture(ObservableFuture<FcmMessage> value) {
    _$fetchMessageFutureAtom.reportWrite(value, super.fetchMessageFuture, () {
      super.fetchMessageFuture = value;
    });
  }

  final _$sendMessageFutureAtom =
      Atom(name: '_FirebaseMessagingStore.sendMessageFuture');

  @override
  ObservableFuture<String> get sendMessageFuture {
    _$sendMessageFutureAtom.reportRead();
    return super.sendMessageFuture;
  }

  @override
  set sendMessageFuture(ObservableFuture<String> value) {
    _$sendMessageFutureAtom.reportWrite(value, super.sendMessageFuture, () {
      super.sendMessageFuture = value;
    });
  }

  final _$_fcmMessageAtom = Atom(name: '_FirebaseMessagingStore._fcmMessage');

  @override
  FcmMessage? get _fcmMessage {
    _$_fcmMessageAtom.reportRead();
    return super._fcmMessage;
  }

  @override
  set _fcmMessage(FcmMessage? value) {
    _$_fcmMessageAtom.reportWrite(value, super._fcmMessage, () {
      super._fcmMessage = value;
    });
  }

  @override
  String toString() {
    return '''
fetchMessageFuture: ${fetchMessageFuture},
sendMessageFuture: ${sendMessageFuture},
loading: ${loading},
fcmMessage: ${fcmMessage}
    ''';
  }
}
