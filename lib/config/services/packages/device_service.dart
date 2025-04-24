import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import '../../constants/tags.dart';

BaseDeviceInfo? _deviceData;

enum DevicePlatform {
  web,
  android,
  iOS,
  macOS,
  linux,
  windows,
  fuchsia;

  bool get isWeb => super == web;
  bool get isAndroid => super == android;
  bool get isIOS => super == iOS;
  bool get isMacOS => super == macOS;
  bool get isLinux => super == linux;
  bool get isWindows => super == windows;
  bool get isFuchsia => super == fuchsia;

  bool get isPhone => (isAndroid || isIOS);
  bool get isApple => (isIOS || isMacOS);
  bool get isDesktop => (isWindows || isLinux || isMacOS);
}

DevicePlatform _platform = DevicePlatform.android;

class DeviceService {
  static String userAgent() {
    if (_deviceData is AndroidDeviceInfo) {
      final device = _deviceData as AndroidDeviceInfo;
      return 'OTP_sender/${Tags.version} (Android ${device.version.release}; ${device.model}; ${device.board}; ${device.supportedAbis.firstOrNull})';
    } else if (_deviceData is IosDeviceInfo) {
      return 'OTP_sender/${Tags.version} (iOS 15.7.6; iPhone; iPhone8,1; arm64v8)';
    }
    return '';
  }

  static String deviceId() {
    if (_deviceData is AndroidDeviceInfo) {
      final device = _deviceData as AndroidDeviceInfo;
      return device.id;
    } else if (_deviceData is IosDeviceInfo) {
      final device = _deviceData as IosDeviceInfo;
      return device.identifierForVendor ?? 'ios';
    }
    return '';
  }

  static DevicePlatform get platform => _platform;
  static final _deviceInfoPlugin = DeviceInfoPlugin();
  static BaseDeviceInfo? get deviceData => _deviceData;

  static Future<void> initPlatformState() async {
    try {
      if (kIsWeb) {
        _platform = DevicePlatform.web;
        _deviceData = await _deviceInfoPlugin.webBrowserInfo;
      } else {
        // _deviceData =
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            {
              _platform = DevicePlatform.android;
              _deviceData = await _deviceInfoPlugin.androidInfo;
            }
          case TargetPlatform.iOS:
            {
              _platform = DevicePlatform.iOS;
              _deviceData = await _deviceInfoPlugin.iosInfo;
            }
          case TargetPlatform.macOS:
            {
              _platform = DevicePlatform.macOS;
              _deviceData = await _deviceInfoPlugin.macOsInfo;
            }
          case TargetPlatform.linux:
            {
              _platform = DevicePlatform.linux;
              _deviceData = await _deviceInfoPlugin.linuxInfo;
            }
          case TargetPlatform.windows:
            {
              _platform = DevicePlatform.windows;
              _deviceData = await _deviceInfoPlugin.windowsInfo;
            }
          case TargetPlatform.fuchsia:
            {
              _platform = DevicePlatform.fuchsia;
            }
        }
      }
    } catch (e) {
      debugPrint('Error on DeviceService>initPlatformState: $e');
    }
  }
}
