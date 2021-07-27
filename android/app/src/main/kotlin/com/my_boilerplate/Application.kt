package com.my_boilerplate

import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin
import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.view.FlutterMain

class Application : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {

   override fun onCreate() {
       super.onCreate()
       //FlutterFirebaseMessagingService.setPluginRegistrant(this)
       FlutterMain.startInitialization(this)
   }

   override fun registerWith(registry: PluginRegistry?) {
       if (!registry!!.hasPlugin("io.flutter.plugins.firebasemessaging")) {
           //FirebaseMessagingPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"))
       }
       if (!registry.hasPlugin("com.dexterous.flutterlocalnotifications")) {
           FlutterLocalNotificationsPlugin.registerWith(registry.registrarFor("com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"))
       }
   }
}
