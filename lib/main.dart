import 'dart:io';
import 'package:bestdroid/app/manager/model_manager.dart';
import 'package:bestdroid/app/manager/output_manager.dart';
import 'package:bestdroid/app/models/model/model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/view/splash/splash_page.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:bestdroid/generated/l10n.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'background_task.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstants.hiveLocalStorage);
  await ModelManager.init();
  await OutputManager.init();
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
