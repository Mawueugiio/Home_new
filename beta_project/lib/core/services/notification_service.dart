import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:beta_project/core/routes.gr.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService._() {
    _init();
  }

  static final NotificationService instance = NotificationService._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      final jsonData = json.decode(payload);
      print("Payload from notification => $jsonData");
      ExtendedNavigator.ofRouter<Router>()
          .pushNamed(Routes.notificationsScreenRoute);
    }
  }

  void clearAll() async => await flutterLocalNotificationsPlugin.cancelAll();

  Future<dynamic> onDidReceiveLocalNotification(
          int id, String title, String body, String payload) =>
      onSelectNotification(payload);

  void _init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = AndroidInitializationSettings('logo');
    var initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) =>
          onDidReceiveLocalNotification(id, title, body, payload.toString()),
    );
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

// Called to show a notification
  void show({String title, String message, dynamic payload}) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'home-iot-system',
        'All notifications',
        'Shows notifications from all channels',
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecond,
      title,
      message,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
