import 'dart:convert';
import 'package:bestdroid/app/models/model_device/device.dart';

class TbDeviceModel {
  TbDeviceModel({
    this.id,
    this.title,
    this.list,
  });

  final int? id;
  final String? title;
  List<DeviceModel>? list;

  factory TbDeviceModel.fromJson(String str) => TbDeviceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TbDeviceModel.fromMap(dynamic json) => TbDeviceModel(
        id: json["id"],
        title: json["title"],
        list: json["list"] == null ? null : List<DeviceModel>.from(json["list"].cast<dynamic>().map(DeviceModel.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toMap())),
      };
}
