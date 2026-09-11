import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'output.g.dart';
@HiveType(typeId: 1)
class OutputModel {
  OutputModel({
    this.deviceId = 0,
    this.id = 0,
    this.title = '',
    this.code = 0,
    this.status = 0,
    this.isMomentary = 0,
  });
  @HiveField(0)
  int id;
  @HiveField(1)
  int deviceId;
  @HiveField(2)
  String title;
  @HiveField(3)
  int code;
  @HiveField(4)
  int status;
  @HiveField(5)
  int isMomentary;

}
