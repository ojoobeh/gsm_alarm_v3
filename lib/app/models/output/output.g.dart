// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OutputModelAdapter extends TypeAdapter<OutputModel> {
  @override
  final int typeId = 1;

  @override
  OutputModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OutputModel(
      deviceId: fields[1] as int,
      id: fields[0] as int,
      title: fields[2] as String,
      code: fields[3] as int,
      status: fields[4] as int,
      isMomentary: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OutputModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.deviceId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.isMomentary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OutputModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
