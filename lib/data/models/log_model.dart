// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'log_model.g.dart';

@HiveType(typeId: 0)
class LogModel {
  @HiveField(0)
  String phone;
  @HiveField(1)
  String otp;
  @HiveField(2)
  String action;
  @HiveField(3)
  String message;
  @HiveField(4)
  String smsType;
  @HiveField(5)
  String requestId;
  @HiveField(6)
  String hashId;
  @HiveField(7)
  int slotIndex;
  @HiveField(8)
  bool status;
  LogModel({
    required this.phone,
    required this.otp,
    required this.action,
    required this.message,
    required this.smsType,
    required this.requestId,
    this.hashId = '',
    required this.slotIndex,
    this.status = false,
  }) {
    if (hashId == '') {
      hashId = DateTime.now().toLocal().toString();
    }
  }

  LogModel copyWith({
    String? phone,
    String? otp,
    String? action,
    String? message,
    String? smsType,
    String? requestId,
    String? hashId,
    int? slotIndex,
    bool? status,
  }) {
    return LogModel(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      action: action ?? this.action,
      message: message ?? this.message,
      smsType: smsType ?? this.smsType,
      requestId: requestId ?? this.requestId,
      hashId: hashId ?? this.hashId,
      slotIndex: slotIndex ?? this.slotIndex,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      // 'otp': otp,
      // 'action': action,
      // 'message': message,
      // 'sms_type': smsType,
      'message_id': requestId,
      'status': status,
    };
  }

  factory LogModel.fromMap(Map map) {
    return LogModel(
      phone: map['phone'] as String,
      otp: map['otp'] as String,
      action: map['action'] as String,
      message: map['message'] as String,
      smsType: map['sms_type'] as String,
      requestId: map['message_id'] ?? '???',
      slotIndex: int.tryParse(map['sim_slot'] ?? '0') ?? 0,
    );
  }

  @override
  String toString() {
    return 'LogModel(phone: $phone, otp: $otp, action: $action, message: $message, smsType: $smsType, requestId: $requestId, hashId: $hashId, slotIndex: $slotIndex, status: $status)';
  }

  @override
  bool operator ==(covariant LogModel other) {
    if (identical(this, other)) return true;

    return other.phone == phone &&
        other.otp == otp &&
        other.action == action &&
        other.message == message &&
        other.smsType == smsType &&
        other.requestId == requestId &&
        other.hashId == hashId &&
        other.slotIndex == slotIndex &&
        other.status == status;
  }

  @override
  int get hashCode {
    return phone.hashCode ^
        otp.hashCode ^
        action.hashCode ^
        message.hashCode ^
        smsType.hashCode ^
        requestId.hashCode ^
        hashId.hashCode ^
        slotIndex.hashCode ^
        status.hashCode;
  }
}
