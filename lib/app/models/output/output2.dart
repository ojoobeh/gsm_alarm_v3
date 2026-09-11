import 'dart:convert';

class Output2Model {
  Output2Model({
    this.deviceId = 0,
    this.id = 0,
    this.title = '',
    this.code = 0,
    this.status = 0,
    this.isMomentary = 0,
  });

  int deviceId;
  int id;
  String title;
  int code;
  int status;
  int isMomentary;

  factory Output2Model.fromJson(String str) => Output2Model.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Output2Model.fromMap(dynamic json) => Output2Model(
    deviceId: json["deviceId"] ?? 0,
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        code: json["code"] ?? 0,
        status: json["status"] ?? 0,
    isMomentary: json["isMomentary"] ?? 0,
      );

  dynamic toMap() => {
        "deviceId": deviceId,
        "id": id,
        "title": title,
        "code": code,
        "status": status,
        "isMomentary": isMomentary,
      };
}
