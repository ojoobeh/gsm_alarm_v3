import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'part.g.dart';
@HiveType(typeId: 2)
class PartModel {
  PartModel({
    this.id,
    this.deviceId = 0,
    this.title,
    this.partNumber,
    this.isActive,
  });
  @HiveField(0)
  int? id;
  @HiveField(1)
  int deviceId;
  @HiveField(2)
  String? title;
  @HiveField(3)
  int? partNumber;
  @HiveField(4)
  int? isActive;
}
