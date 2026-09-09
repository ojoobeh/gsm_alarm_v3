part of 'core.dart';

enum ThemeType { light, dark }

class AppDecoration {
  static OutlineInputBorder textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: context.theme.dividerColor),
  );
}

class AppColors {
  static const Color primaryDark = Color.fromRGBO(255, 255, 255, 1);
  static const Color error = Color.fromRGBO(255, 0, 78, 1);
  static const Color buttonTextColor = Color(0xff4584f9);
  static const Color textUploadColor = Color(0xff5ABDFF);
  static const Color buttonTextColorLight = Color(0xffdbedff);
  static const Color buttonTextColorLight2 = Color(0xfff2f2f2);
  static const Color success = Color.fromRGBO(1, 200, 67, 1);
  static const Color transparent = Colors.transparent;
  static const Color gold = Color(0xffff9d00);
  static const Color silver = Color.fromRGBO(128, 128, 128, 1);
  static const Color bronze = Color.fromRGBO(236, 152, 67, 1);
  static const Color red = Color.fromRGBO(252, 66, 66, 1);
  // static const Color closeRed = Color.fromRGBO(255, 0, 78, 1);
  static const Color purple = Color.fromRGBO(213, 102, 255, 1);
  static const Color darkPurple = Color.fromRGBO(102, 106, 245, 1);
  static const Color green = Color.fromRGBO(89, 201, 104, 1);
  static const Color white = Color.fromRGBO(248, 248, 248, 1);
  static const Color black = Color(0xff2e2e2e);
  static const Color blueLight = Color(0xff30d5ff);
  static const Color blackIcon = Color(0x772e2e2e);
  static const Color grey = Color(0xffadaca7);
}

class AppColorsLight {
  static const Color primary = Color(0xff0062ff);
  static const Color primaryLight = Color(0xffdbe9ff);
  static const Color primaryDark = Color(0xff364f6b);
  static const Color highlight = Color(0xff364f6b);
  static const Color disabled = Color(0xffedf0f3);
  static const Color divider = Color(0xff8c9fb7);
  static const Color border = Color(0xffb1bfd0);
  static const Color background = Color(0xfff5f5f5);
  static const Color textSelection = Color(0xff0062ff);
  static const Color canvas = Color(0xffeff2f7);

  static const Color indicator = Color(0xffeff2f6);
  static const Color hint = Color(0xffbcc8d8);
  static const Color shadow = Color(0xff8d8989);
  static const Color card = Color(0xffedf0f3);
}

class AppColorsDark {
  static const Color primary = Color(0xff0062ff);
  static const Color primaryLight = Color(0xff142847);
  static const Color primaryDark = Color(0xffffffff);
  static const Color highlight = Color(0xff415276);
  static const Color disabled = Color(0xff1F2C34);
  static const Color divider = Color(0xffedf0f3);
  static const Color background = Color(0xff121b22);
  static const Color textSelection = Color(0xff77abff);
  static const Color hint = Color(0xffc4c4c4);
  static const Color indicator = Color(0xff2b2b2b);
  static const Color shadow = Color(0xff343030);
  static const Color card = Color(0xff2e2e2e);
  static const Color canvas = Color(0xff262626);
}

class AppThemes {
  static ThemeData lightTheme() {
    final TextStyle baseTextStyleBold = TextStyle(
      color: AppColorsLight.primaryDark,
      fontFamily: isPersianLang() ? 'IRANSansWeb_Bold' : "IRANSansWeb_Bold",
    );

    final TextStyle baseTextStyleMedium = TextStyle(
      color: AppColorsLight.primaryDark,
      fontFamily: isPersianLang() ? 'IRANSansWeb_Medium' : "IRANSansWeb_Medium",
    );
    final TextStyle baseTextStyleLight = TextStyle(
      color: AppColorsLight.primaryDark,
      fontFamily: isPersianLang() ? 'IRANSansWeb_Light' : "IRANSansWeb_Light",
    );
    return ThemeData(
      hoverColor: AppColors.error,
      dividerColor: AppColorsLight.divider,
      primaryColor: AppColorsLight.primary,
      primaryColorLight: AppColorsLight.primaryLight,
      primaryColorDark: AppColorsLight.primaryDark,
      highlightColor: AppColorsLight.highlight,
      disabledColor: AppColorsLight.disabled,
      hintColor: AppColorsLight.hint,
      scaffoldBackgroundColor: AppColorsLight.background,
      cardColor: Colors.white,
      splashColor: AppColors.buttonTextColorLight,
      shadowColor: AppColorsLight.shadow,
      canvasColor: AppColorsLight.canvas,
      secondaryHeaderColor: AppColors.black,
      focusColor: Colors.yellow,
      iconTheme: const IconThemeData(color: AppColorsLight.primaryLight),
      cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.dark),
      textTheme: TextTheme(
        displayLarge: baseTextStyleBold.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        displayMedium: baseTextStyleMedium.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
        displaySmall: baseTextStyleLight.copyWith(fontSize: 20, fontWeight: FontWeight.w300),
        headlineLarge: baseTextStyleBold.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        headlineMedium: baseTextStyleMedium.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
        headlineSmall: baseTextStyleLight.copyWith(fontSize: 18, fontWeight: FontWeight.w300),
        titleLarge: baseTextStyleBold.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        titleMedium: baseTextStyleMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        titleSmall: baseTextStyleLight.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
        bodyLarge: baseTextStyleBold.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        bodyMedium: baseTextStyleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        bodySmall: baseTextStyleLight.copyWith(fontSize: 14, fontWeight: FontWeight.w300),
        labelLarge: baseTextStyleBold.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
        labelMedium: baseTextStyleMedium.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: baseTextStyleLight.copyWith(fontSize: 12, fontWeight: FontWeight.w300),
      ),
      // cardTheme: CardTheme(clipBehavior: Clip.hardEdge, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColorsLight.primary),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
        ),
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(vertical: 12, horizontal: 20))),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: AppColorsLight.background, foregroundColor: Colors.black, elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        hintStyle: TextStyle(color: AppColorsLight.primaryDark)
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColorsLight.primaryDark)),
        // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColorsLight.primaryDark)),
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColorsLight.primaryDark)),
      //   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColorsLight.primaryDark)),
      // ),
    );
  }

  static ThemeData darkTheme() {
    final TextStyle baseTextStyleBold = TextStyle(
      color: AppColorsDark.primaryDark,
      fontFamily: isPersianLang() ? 'IRANSansWeb_Bold' : "IRANSansWeb_Bold",
    );

    final TextStyle baseTextStyleMedium = TextStyle(
      color: AppColorsDark.primaryDark,
      fontFamily: isPersianLang() ? 'IRANSansWeb_Medium' : "IRANSansWeb_Medium",
    );
    final TextStyle baseTextStyleLight = TextStyle(
      color: AppColorsDark.primaryDark,
      fontFamily: isPersianLang() ? 'IRANSansWeb_Light' : "IRANSansWeb_Light",
    );

    return ThemeData.dark().copyWith(
      hoverColor: AppColors.error,
      dividerColor: AppColorsDark.divider,
      primaryColor: AppColorsDark.primary,
      unselectedWidgetColor: const Color(0xff0d1419),
      primaryColorLight: AppColorsDark.primaryLight,
      primaryColorDark: AppColorsDark.primaryDark,
      highlightColor: AppColorsDark.highlight,
      disabledColor: AppColorsDark.disabled,
      hintColor: AppColorsDark.hint,
      scaffoldBackgroundColor: AppColorsDark.background,
      cardColor: const Color(0xff0D161D),
      canvasColor: AppColorsDark.canvas,
      splashColor: AppColors.white,
      shadowColor: AppColorsDark.shadow,
      secondaryHeaderColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColorsDark.primaryLight),
      textTheme: TextTheme(
        displayLarge: baseTextStyleBold.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        displayMedium: baseTextStyleMedium.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
        displaySmall: baseTextStyleLight.copyWith(fontSize: 20, fontWeight: FontWeight.w300),
        headlineLarge: baseTextStyleBold.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        headlineMedium: baseTextStyleMedium.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
        headlineSmall: baseTextStyleLight.copyWith(fontSize: 18, fontWeight: FontWeight.w300),
        titleLarge: baseTextStyleBold.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        titleMedium: baseTextStyleMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        titleSmall: baseTextStyleLight.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
        bodyLarge: baseTextStyleBold.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        bodyMedium: baseTextStyleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        bodySmall: baseTextStyleLight.copyWith(fontSize: 14, fontWeight: FontWeight.w300),
        labelLarge: baseTextStyleBold.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
        labelMedium: baseTextStyleMedium.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: baseTextStyleLight.copyWith(fontSize: 12, fontWeight: FontWeight.w300),
      ),
      // cardTheme: CardTheme(clipBehavior: Clip.hardEdge, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColorsDark.primary),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
        ),
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(vertical: 12, horizontal: 20))),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: AppColorsDark.background, foregroundColor: Colors.white, elevation: 0),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColorsDark.primaryDark)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColorsDark.primaryDark)),
      ),
    );
  }
}


