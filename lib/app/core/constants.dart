part of 'core.dart';

class AppConstants {
  static const String theme = "theme";
  static const String darkTheme = "darkTheme";
  static const String lightTheme = "lightTheme";
  static const String deviceModelId = "deviceModelId";
  static const String partModelId = "partModelId";
  static const String isWifi = "isWifi";
  static const String part1IsOn = "part1IsOn";
  static const String part2IsOn = "part2IsOn";
  static const String setLocation = "setLocation";
  static const String countOfOutput = "countOfOutput";
  static const String locationSettingModelId = "locationSettingModelId";
  static const String defaultAdminPassword = "1234";
  static const String defaultLoginPassword = "1234";

  static Decoration? customDecoration({double? borderRadius,Color? color})=>BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius ?? 8),
    color: color,
    border: Border.all(color: context.theme.primaryColorDark, width: 1),
  );
}
