import 'dart:convert';

import 'package:bestdroid/app/models/output/output.dart';

class TbOutputModel {
  TbOutputModel({
    this.id,
    this.title,
    this.list,
  });

  final int? id;
  final String? title;
  List<OutputModel>? list;

  factory TbOutputModel.fromJson(String str) => TbOutputModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TbOutputModel.fromMap(dynamic json) => TbOutputModel(
        id: json["id"],
        title: json["title"],
        list: json["list"] == null ? null : List<OutputModel>.from(json["list"].cast<dynamic>().map(OutputModel.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toMap())),
      };
}
