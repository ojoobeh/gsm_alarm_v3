import 'package:flutter/services.dart';

class BatteryOptimizationHelper {
  static const platform = MethodChannel('battery_optimization');

  /// بررسی فعال یا غیرفعال بودن بهینه‌سازی باتری
  static Future<bool> isIgnoringBatteryOptimizations() async {
    try {
      final bool result = await platform.invokeMethod('isIgnoringBatteryOptimizations');
      return result;
    } on PlatformException catch (e) {
      print("Failed to check battery optimization status: ${e.message}");
      return false;
    }
  }

  /// باز کردن صفحه تنظیمات بهینه‌سازی باتری
  static Future<void> openBatteryOptimizationSettings() async {
    try {
      await platform.invokeMethod('openBatteryOptimizationSettings');
    } on PlatformException catch (e) {
      print("Failed to open battery optimization settings: ${e.message}");
    }
  }
}
