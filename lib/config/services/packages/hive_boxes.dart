import 'package:otp_sms_sender/config/core/exports.dart';
import 'package:otp_sms_sender/data/models/log_model.dart';

import '../../constants/tags.dart';

class Boxes {
  static Future init({int? version, String? initPath}) async {
    await Hive.initFlutter(initPath);
    try {
      registerAdapters();
    } catch (e) {
      debugPrint("++++registerAdapters error:=$e");
    }
    await openBoxes().then((_) async {});
  }

  static void registerAdapters() {
    Hive.registerAdapter(LogModelAdapter());
    Hive.registerAdapter(SenderModelAdapter());
  }

  static Future<Box<T>> openBox<T>(String name) async {
    final result = await Hive.openBox<T>(name).catchError((error, s) async {
      debugPrint("+++Something goes wrong on Hive: $name : $error ,   $s");
      return Hive.openBox<T>(name);
    });
    return result;
  }

  static Future<List<void>> openBoxes() async {
    return Future.wait([
      openBox<dynamic>(HiveT.base),
      openBox<LogModel>(HiveT.logs),
      openBox<SenderEntity>(HiveT.senders),
    ]);
  }

  static Box base = Hive.box(HiveT.base);
  static Box<LogModel> get logs => Hive.box(HiveT.logs);
  static Box<SenderEntity> senders = Hive.box(HiveT.senders);

  static String? get fireToken => base.get(HiveT.fireToken);
  static Future<void> putFireToken(String? val) =>
      base.put(HiveT.fireToken, val);

  static String? get domain => base.get(HiveT.domain);
  static Future<void> putDomain(String? val) => base.put(HiveT.domain, val);
}
