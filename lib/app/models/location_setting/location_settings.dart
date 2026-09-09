import 'dart:convert';

class LocationSettingModel {
  LocationSettingModel({
    this.id,
    this.name,
    this.modelType,
    this.partType,
    this.modelName,
    this.simType,
    this.simNumber,
    this.password = "",
    this.selected,
    this.isWifi,
    this.isMultiPart,
  });

  int? id;
  final String? name;
  final int? modelType;
  final int? partType;
  final String? modelName;
  final int? simType;
  final String? simNumber;
  final String password;
  int? selected;
  final int? isWifi;
  final int? isMultiPart;

  factory LocationSettingModel.fromJson(String str) => LocationSettingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationSettingModel.fromMap(dynamic json) => LocationSettingModel(
        id: json["id"],
        name: json["name"],
        modelType: json["modelType"],
        partType: json["partType"],
        modelName: json["modelName"],
        simType: json["simType"],
        simNumber: json["simNumber"],
        password: json["password"],
        selected: json["selected"],
        isWifi: json["isWifi"],
        isMultiPart: json["isMultiPart"],
      );

  dynamic toMap() => {
        "id": id,
        "name": name,
        "modelType": modelType,
        "partType": partType,
        "modelName": modelName,
        "simType": simType,
        "simNumber": simNumber,
        "password": password,
        "selected": selected,
        "isWifi": isWifi,
        "isMultiPart": isMultiPart,
      };
}
