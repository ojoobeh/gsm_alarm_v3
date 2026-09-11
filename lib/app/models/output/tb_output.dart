import 'dart:convert';

import 'package:bestdroid/app/models/output/output2.dart';

class TbOutputModel {
  TbOutputModel({
    this.id,
    this.title,
    this.list,
  });

  final int? id;
  final String? title;
  List<Output2Model>? list;

  factory TbOutputModel.fromJson(String str) => TbOutputModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TbOutputModel.fromMap(dynamic json) => TbOutputModel(
        id: json["id"],
        title: json["title"],
        list: json["list"] == null ? null : List<Output2Model>.from(json["list"].cast<dynamic>().map(Output2Model.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toMap())),
      };
}
