// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sender_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SenderModelAdapter extends TypeAdapter<SenderModel> {
  @override
  final int typeId = 1;

  @override
  SenderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SenderModel(
      deviceId: fields[0] as String,
      phone: fields[1] as String?,
      simSlot: fields[2] as int?,
      fcmToken: fields[3] as String,
      isEdit: fields[4] ?? true,
      hashId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SenderModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.deviceId)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.simSlot)
      ..writeByte(3)
      ..write(obj.fcmToken)
      ..writeByte(4)
      ..write(obj.isEdit)
      ..writeByte(5)
      ..write(obj.hashId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SenderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
