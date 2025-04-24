// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogModelAdapter extends TypeAdapter<LogModel> {
  @override
  final int typeId = 0;

  @override
  LogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogModel(
      phone: fields[0] as String,
      otp: fields[1] as String,
      action: fields[2] as String,
      message: fields[3] as String,
      smsType: fields[4] as String,
      requestId: fields[5] as String,
      slotIndex: fields[7] as int,
      hashId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LogModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.phone)
      ..writeByte(1)
      ..write(obj.otp)
      ..writeByte(2)
      ..write(obj.action)
      ..writeByte(3)
      ..write(obj.message)
      ..writeByte(4)
      ..write(obj.smsType)
      ..writeByte(5)
      ..write(obj.requestId)
      ..writeByte(6)
      ..write(obj.hashId)
      ..writeByte(7)
      ..write(obj.slotIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
