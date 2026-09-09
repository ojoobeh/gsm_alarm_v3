import 'dart:convert';

class ZoneModel {
  ZoneModel({
    this.id=0,
    this.title,
    this.status,
  });

  int id;
  String? title;
  String? status;

  factory ZoneModel.fromJson(String str) => ZoneModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ZoneModel.fromMap(dynamic json) => ZoneModel(
        id: json["id"] ?? 0,
        title: json["title"],
        status: json["status"],
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "status": status,
      };
}
