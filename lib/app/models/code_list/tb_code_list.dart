import 'dart:convert';
import 'package:bestdroid/app/models/code_list/code.dart';

class TbCodeModel {
  TbCodeModel({
    this.id,
    this.title,
    this.list,
  });

  final int? id;
  final String? title;
  final List<CodeModel>? list;

  factory TbCodeModel.fromJson(String str) => TbCodeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TbCodeModel.fromMap(dynamic json) => TbCodeModel(
        id: json["id"],
        title: json["title"],
        list: json["list"] == null ? null : List<CodeModel>.from(json["list"].cast<dynamic>().map(CodeModel.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toMap())),
      };
}
