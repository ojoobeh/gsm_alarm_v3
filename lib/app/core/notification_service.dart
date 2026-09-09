// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:sms_maintained/sms.dart';
//
// // نمونه کلاس برای مدیریت اعلان‌های محلی
// class NotificationService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   NotificationService() {
//     final initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//     final initializationSettingsIOS = IOSInitializationSettings();
//     final initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   // تابع زمان‌بندی اعلان
//   Future<void> scheduleSms(
//       DateTime scheduledTime, String phoneNumber, String message) async {
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'your_channel_id', 'your_channel_name',
//         importance: Importance.max, priority: Priority.high);
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin!.show(
//       0,
//       'ارسال پیامک',
//       'پیامک در حال ارسال است',
//
//       scheduledTime,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//     );
//
//     // ارسال پیامک در زمان مشخص
//     Future.delayed(scheduledTime.difference(DateTime.now()), () {
//       sendSms(phoneNumber, message);
//     });
//   }
//
//   // تابع ارسال پیامک
//   void sendSms(String phoneNumber, String message) {
//     SmsSender sender = SmsSender();
//     SmsMessage sms = SmsMessage(phoneNumber, message);
//     sender.sendSms(sms);
//   }
// }
