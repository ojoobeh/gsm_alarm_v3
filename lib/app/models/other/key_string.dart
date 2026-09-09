import 'dart:convert';

  class KeyStringModel {
  KeyStringModel({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  factory KeyStringModel.fromJson(String str) => KeyStringModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KeyStringModel.fromMap(dynamic json) => KeyStringModel(
        id: json["id"],
        title: json["title"],
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
      };
}
