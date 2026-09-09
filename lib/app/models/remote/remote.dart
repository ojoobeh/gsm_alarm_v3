import 'dart:convert';

class RemoteModel {
  RemoteModel({
    this.id=0,
    this.title='',
  });

  int id;
  String title;

  factory RemoteModel.fromJson(String str) => RemoteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RemoteModel.fromMap(dynamic json) => RemoteModel(
        id: json["id"]??0,
        title: json["title"]??'',
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
      };
}
