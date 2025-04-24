import 'package:flutter/services.dart';
import 'package:sms_sender_background/sms_sender.dart';

class SmsSenderBgService {
  static final _smsSender = SmsSender();
  static bool _hasPermission = false;
  static String _status = '';

  static Future<void> checkPermission() async {
    try {
      final hasPermission = await _smsSender.checkSmsPermission();
      _hasPermission = hasPermission;
      _status = hasPermission ? 'Permission granted' : 'Permission denied';
    } catch (e) {
      _status = 'Error checking permission: $e';
    }
  }

  static Future<bool> requestPermission() async {
    try {
      final granted = await _smsSender.requestSmsPermission();

      _hasPermission = granted;
      _status = granted ? 'Permission granted' : 'Permission denied';

      return true;
    } catch (e) {
      _status = 'Error requesting permission: $e';
      return false;
    }
  }

  static Future<void> sendSms(
    String phoneNumber,
    String message, {
    int simSlot = 0,
  }) async {
    if (!_hasPermission) {
      await requestPermission().then((value) {
        if (value) {
          _hasPermission = true;
        } else {
          throw 'SMS permission not granted';
        }
      });
    }

    try {
      final success = await _smsSender.sendSms(
        phoneNumber: phoneNumber,
        message: message,
        simSlot: simSlot,
      );

      _status = success ? 'SMS sent successfully' : 'Failed to send SMS';

      if (success) {}
    } on PlatformException catch (e) {
      throw 'Error sending SMS: ${e.message}';
    }
  }
}
