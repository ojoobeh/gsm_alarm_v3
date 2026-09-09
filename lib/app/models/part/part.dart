import 'dart:convert';

class PartModel {
  PartModel({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  factory PartModel.fromJson(String str) => PartModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PartModel.fromMap(dynamic json) => PartModel(
        id: json["id"],
        title: json["title"],
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
      };
}
