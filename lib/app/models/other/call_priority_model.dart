import 'dart:convert';

class CallPriorityModel {
  CallPriorityModel({
    this.id=0,
    this.title,
  });

  int id;
  String? title;

  factory CallPriorityModel.fromJson(String str) => CallPriorityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CallPriorityModel.fromMap(dynamic json) => CallPriorityModel(
        id: json["id"]??0,
        title: json["title"],
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
      };
}
