import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
// import 'package:sim_card_info/sim_card_info.dart';

// import 'permission_services.dart';

class MobileNumberService {
  static bool isPermissionGranted = false;
  static List<SimCard> _simCards = <SimCard>[];

  static List<SimCard> get simCards => _simCards;

  static Future<bool> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
    } else {
      isPermissionGranted = true;
    }
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _simCards = (await MobileNumber.getSimCards)!;
      isPermissionGranted = true;
      return true;
    } on PlatformException catch (e) {
      return false;
      // throw ("Failed to get mobile number because of '${e.message}'");
    }
  }
}
