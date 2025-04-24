// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'sender_model.g.dart';

@HiveType(typeId: 1)
class SenderModel {
  @HiveField(0)
  String deviceId;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  int? simSlot;
  @HiveField(3)
  String fcmToken;
  @HiveField(4)
  bool isEdit;
  @HiveField(5)
  String hashId;
  SenderModel({
    required this.deviceId,
    this.phone,
    this.simSlot,
    required this.fcmToken,
    this.isEdit = true,
    this.hashId = '',
  }) {
    if (hashId == '') {
      hashId = DateTime.now().toLocal().toString();
    }
  }

  SenderModel copyWith({
    String? deviceId,
    String? phone,
    int? simSlot,
    String? fcmToken,
    bool? isEdit,
    String? hashId,
  }) {
    return SenderModel(
      deviceId: deviceId ?? this.deviceId,
      phone: phone ?? this.phone,
      simSlot: simSlot ?? this.simSlot,
      fcmToken: fcmToken ?? this.fcmToken,
      isEdit: isEdit ?? this.isEdit,
      hashId: hashId ?? this.hashId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'device_id': deviceId,
      'phone': phone,
      'sim_slot': simSlot,
      'fcm_token': fcmToken,
    };
  }

  factory SenderModel.fromMap(Map map) {
    return SenderModel(
      deviceId: map['device_id'] as String,
      phone: map['phone'] as String,
      simSlot: map['sim_slot'] as int,
      fcmToken: map['fcm_token'] as String,
    );
  }

  @override
  String toString() {
    return 'SenderModel(deviceId: $deviceId, phone: $phone, simSlot: $simSlot, fcmToken: $fcmToken, isEdit: $isEdit, hashId: $hashId)';
  }

  @override
  bool operator ==(covariant SenderModel other) {
    if (identical(this, other)) return true;

    return other.deviceId == deviceId &&
        other.phone == phone &&
        other.simSlot == simSlot &&
        other.fcmToken == fcmToken &&
        other.isEdit == isEdit &&
        other.hashId == hashId;
  }

  @override
  int get hashCode {
    return deviceId.hashCode ^
        phone.hashCode ^
        simSlot.hashCode ^
        fcmToken.hashCode ^
        isEdit.hashCode ^
        hashId.hashCode;
  }
}
