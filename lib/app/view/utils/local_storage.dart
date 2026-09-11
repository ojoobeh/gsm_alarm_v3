import 'package:bestdroid/app/core/core.dart';
import 'package:hive/hive.dart';

void setData(final String key, final dynamic value) =>
    Hive.box(AppConstants.hiveLocalStorage).put(key ,value);

int? getInt(final String key) => Hive.box(AppConstants.hiveLocalStorage).get(key);

String? getString(final String key) => Hive.box(AppConstants.hiveLocalStorage).get(key);

bool? getBool(final String key) => Hive.box(AppConstants.hiveLocalStorage).get(key);

double? getDouble(final String key) => Hive.box(AppConstants.hiveLocalStorage).get(key);
List<String>? getStringList(final String key) => Hive.box(AppConstants.hiveLocalStorage).get(key);

dynamic getData(final String key) => Hive.box(AppConstants.hiveLocalStorage).get(key);

void clearData() => Hive.box(AppConstants.hiveLocalStorage).clear();


// import 'package:get_storage/get_storage.dart';

// void setData(final String key, final dynamic value) => GetStorage().write(key, value);
//
//
// int? getInt(final String key) => GetStorage().read(key);
//
// String? getString(final String key) => GetStorage().read(key);
//
// bool getBool(final String key) => GetStorage().read(key)??false;
//
//
// double? getDouble(final String key) => GetStorage().read(key);
//
// dynamic getData(final String key) => GetStorage().read(key);
//
// void clearData() => GetStorage().erase();

//
// void setString(final String key, final String value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString(key, value);
// }
//
// void setInt(final String key, final int value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setInt(key, value);
// }
//
// void setBool(final String key, final bool value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool(key, value);
// }
//
// void setDouble(final String key, final double value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setDouble(key, value);
// }
//
// void setStringList(final String key, final List<String> value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setStringList(key, value);
// }
//
// void clearData() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.clear();
// }
//
// Future<int> getInt(final String key) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getInt(key) ?? 0;
// }
//
// Future<String> getString(final String key) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString(key) ?? '';
// }
//
// Future<bool> getBool(final String key) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getBool(key) ?? false;
// }
//
// Future<double> getDouble(final String key) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getDouble(key) ?? 0;
// }
//
// Future<List<String>> getStringList(final String key) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getStringList(key) ?? <String>[];
// }
