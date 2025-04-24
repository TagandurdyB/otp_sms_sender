import 'dart:convert';

import '../../core/exports.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission_services.dart';

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

void handleMessage(Map<String, dynamic>? payload) {
  if (payload != null) {
    try {
      debugPrint("+++Payload:$payload");
      final data = payload['data'] as Map;
      debugPrint("+++data:$data");
      final log = LogEntity.fromMap(data);
      SmsSenderBgService.sendSms(
        log.phone,
        log.message,
        simSlot: log.slotIndex + 1,
      );
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
