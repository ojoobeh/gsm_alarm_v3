import 'dart:convert';

import 'package:bestdroid/app/models/model_device/device.dart';
import 'package:bestdroid/app/models/output/output.dart';
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Model {
  Model({this.id, this.title, this.modelId, this.phone, this.password, this.deviceModel, this.partId, this.outputModels});

  @HiveField(0)
  int? id;
  @HiveField(1)
  int? modelId;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  String? password;
  @HiveField(5)
  int? partId;
  DeviceModel? deviceModel;
  List<OutputModel>? outputModels;
}
