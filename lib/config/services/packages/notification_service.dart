import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/exports.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission_services.dart';

final Dio _dio = Dio();

class NotificationModel {
  final int id;
  final String? title;
  final String? body;
  final Map<String, dynamic>? payload;

  NotificationModel({
    required this.id,
    this.title,
    this.body,
    this.payload,
  });
}

void handleMessage(Map<String, dynamic>? payload) async {
  if (payload != null) {
    try {
      debugPrint("+++Payload:$payload");
      final data = payload['data'] as Map;
      debugPrint("+++data:$data");
      LogEntity log = LogEntity.fromMap(data);
      final status = await SmsSenderBgService.sendSms(
        log.phone,
        log.message,
        simSlot: log.slotIndex + 1,
      );
      log = log.copyWith(status: status);
      if (status) {
        await smsStatus(log);
      }
      Boxes.init().then(
        (value) {
          Boxes.logs.put(log.hashId, log);
        },
      );
    } catch (e, s) {
      throw "++++UnCorrect data coming from backend!!!  $e  : $s";
    }
  }
}

/// /
Future smsStatus(LogEntity data) async {
  try {
    _dio.post(
      '${Boxes.domain}/api/message/sent',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer C0PiTyxmgYhKeNd9Pt2z1UUkpPDoeG2A',
      }),
      data: data.toMap(),
    );
  } catch (e, s) {
    print('Error: $e ||||||||| $s');
  }
}
/// /

class NotificationService {
//Local================================================================
  static const _androidChannel = AndroidNotificationChannel(
    "high_importante_channel",
    "High Importante Notification",
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance,
  );

  static final _localNotifications = FlutterLocalNotificationsPlugin();

  static Future initLocalNotifications() async {
    final result = await PermisService.requestPermis(Permission.notification);
    if (result == false) {
      // ToastService.message('Please allow notification!', false);
    }
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (notification) {
        final payload = jsonDecode(notification.payload!);
        handleMessage(payload as Map<String, dynamic>?);
      },
    );

    final platformAndroid =
        _localNotifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await platformAndroid?.createNotificationChannel(_androidChannel);
  }

  static void showLocalNotification(NotificationModel? model) async {
    if (model == null) return;
    _localNotifications.show(
      model.id,
      model.title,
      model.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id, _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@mipmap/ic_launcher',
          // icon: '@mipmap-xxxhdpi/ic_launcher',
          channelShowBadge: true,
          // styleInformation: bigPictureStyleInformation,
        ),
      ),
      payload: jsonEncode(model.payload),
    );
  }
}
