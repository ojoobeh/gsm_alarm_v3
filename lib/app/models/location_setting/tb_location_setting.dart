import 'dart:convert';

import 'package:bestdroid/app/models/location_setting/location_settings.dart';

class TbLocationSettingModel {
  TbLocationSettingModel({
    this.id,
    this.title,
    this.list,
  });

  final int? id;
  final String? title;
  List<LocationSettingModel>? list;

  factory TbLocationSettingModel.fromJson(String str) => TbLocationSettingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TbLocationSettingModel.fromMap(dynamic json) => TbLocationSettingModel(
        id: json["id"],
        title: json["title"],
        list: json["list"] == null ? null : List<LocationSettingModel>.from(json["list"].cast<dynamic>().map(LocationSettingModel.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toMap())),
      };
}
