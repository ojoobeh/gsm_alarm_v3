import 'dart:io';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/view/splash/splash_page.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:bestdroid/generated/l10n.dart';

import 'background_task.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//

  // if (isAndroid) {
  //   await AndroidAlarmManager.initialize();
  // }

  // // ثبت دومین وظیفه برای ساعت 10:30
  // Workmanager().registerPeriodicTask(
  //   "2",
  //   "sendSmsTask2",
  //   frequency: Duration(hours: 24), // اجرا هر 24 ساعت
  //   initialDelay: Duration(hours: 10, minutes: 30), // اجرا در ساعت 10:30
  // );

  await GetStorage.init();
  if (getData("locale") == null) setData("locale", Core.defaultLocal);
  HttpOverrides.global = MyHttpOverrides();
  // Workmanager().initialize(
  //   callbackDispatcher,
  //   isInDebugMode: false,
  // );
  //
  // Workmanager().registerPeriodicTask(
  //   "1",
  //   "sendSmsTask",
  //   frequency: const Duration(minutes: 20), // اجرا هر 24 ساعت
  //   // initialDelay: const Duration(hours: 15,minutes: 27), // اجرا در ساعت 10:00
  // );

  if (isAndroid) {
    // initializeService();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        S.delegate,
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('fa'), Locale('en')],
      locale: Locale(getData("locale") ?? 'fa'),
      theme: getTheme(),
      darkTheme: AppThemes.darkTheme(),
      themeMode: ThemeMode.light,
      home: const SplashPage(),
    );
  }
}
