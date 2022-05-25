// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
//
// class NotificationService {
//   static final NotificationService _notificationService = NotificationService._internal();
//
//   factory NotificationService() {
//     return _notificationService;
//   }
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//
//     final InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid);
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: selectNotification);
//   }
//
//
//   Future selectNotification(int id,String title,String body) async {
//     //Handle notification tapped logic here
//     await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body, tz.TZDateTime.now(tz.local).add(Duration(seconds: 2)),
//         const NotificationDetails(
//             android: AndroidNotificationDetails('CHANNEL_ID', 'CHANNEL_NAME',
//                 'CHANNEL_DESCRIPTION')),
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//         androidAllowWhileIdle: true)
//   }
//
//
//
//
//   NotificationService._internal();
//
//
//
// }


import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;


class NotificationService {
  static final NotificationService _notificationService =
  NotificationService.internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  NotificationService.internal();

  Future <void> initNotification() async {

    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =

    InitializationSettings(android: initializationSettingsAndroid);
    // the settings are initialized after they are set by the UI
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }

  Future<void> showNotification(int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(
          seconds: 2
      )),
    const NotificationDetails(
            android: AndroidNotificationDetails('CHANNEL_ID', 'CHANNEL_NAME',
                'CHANNEL_DESCRIPTION')),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle:
      true,
    );
  }

}