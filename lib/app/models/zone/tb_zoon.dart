import 'dart:convert';

import 'package:bestdroid/app/models/zone/zone.dart';

class TbZoneModel {
  TbZoneModel({
    this.id,
    this.title,
    this.list,
  });

  final int? id;
  final String? title;
  List<ZoneModel>? list;

  factory TbZoneModel.fromJson(String str) => TbZoneModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TbZoneModel.fromMap(dynamic json) => TbZoneModel(
        id: json["id"],
        title: json["title"],
        list: json["list"] == null ? null : List<ZoneModel>.from(json["list"].cast<dynamic>().map(ZoneModel.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toMap())),
      };
}
