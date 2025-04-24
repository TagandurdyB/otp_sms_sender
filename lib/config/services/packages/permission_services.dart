import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

import 'device_service.dart';

typedef Permis = Permission;

/*
<!--for android 13 and above-->
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES" /> <!-- For Images-->
    <uses-permission android:name="android.permission.READ_MEDIA_VIDEOS" /> <!-- For video-->
    <uses-permission android:name="android.permission.READ_MEDIA_AUDIO" /> <!-- For Audio-->

<!-- for below android 13-->
    <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
*/

class PermisService {
  static Future<bool> requestPermis(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      final result = await permission.request();
      if (result == PermissionStatus.granted) {
        debugPrint(
            "============================================$permission granted");
        return true;
      } else if (result == PermissionStatus.permanentlyDenied) {
        debugPrint(
            "============================================openAppSettings");
        if (DeviceService.platform.isIOS) {
          return true;
        } else {
          return await openAppSettings();
        }
      } else if (result == PermissionStatus.denied) {
        debugPrint(
            "============================================$permission denied");
        return false;
      } else {
        throw "$permission Error !!!";
      }
    }
  }

  static Future<bool> getStoragePermission() async {
    bool storage = false;
    BaseDeviceInfo? deviceData = DeviceService.deviceData;
    if (deviceData is AndroidDeviceInfo) {
      debugPrint("+++Android SDK version: ${deviceData.version.sdkInt}");
      try {
        if (deviceData.version.sdkInt < 33) {
          storage = await requestPermis(Permis.storage);
        } else {
          storage = true;
          // storage = await requestPermis(Permis.storage);
          //   storage = await requestPermis(Permis.manageExternalStorage);
        }
      } catch (e) {
        throw "+++Storage Permis Error : $e";
      }
    } else {
      storage = await requestPermis(Permis.storage);
    }
    print("++++++++getStoragePermission:=$storage");
    return storage;
  }
}
