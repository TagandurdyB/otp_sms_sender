import 'package:otp_sms_sender/config/core/exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../firebase_options.dart';
import '../notification_service.dart';

// part 'remote_config_service.dart';
// part 'firestore_service.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint("+++Background Firabase Notification toMap: ${message.toMap()}");
  Future.delayed(const Duration(seconds: 3))
      .then((_) => handleMessage(message.toMap()));
// debugPrint("+++Img: ${message.notification?.}");
}

class FirebaseService {
  // static RemoteConfigService get remoteConfig => RemoteConfigService();

  late FirebaseMessaging _firebaseMessaging;

  void _handle(RemoteMessage? message) {
    if (message == null) return;
    handleMessage(message.toMap());
  }

//Remote===============================================================
  initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(_handle);
    FirebaseMessaging.onMessageOpenedApp.listen(_handle);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      handleMessage(message.toMap());
      // NotificationService.showLocalNotification(NotificationModel(
      //   id: notification.hashCode,
      //   title: notification.title,
      //   body: notification.body,
      //   payload: message.toMap(),
      // ));
    });
  }

//====================================================================
  Future<void> initNotifications() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    await _firebaseMessaging.requestPermission(
      // provisional: ,
      alert: true,
      badge: true,
      sound: true,
    );
    await Future.delayed(const Duration(seconds: 1));
    try {
      String? fireToken;
      if (DeviceService.platform.isIOS) {
        fireToken = await _firebaseMessaging.getAPNSToken();

        // await _firebaseMessaging.getAPNSToken().then((_) async {
        // });
      } else {
        fireToken = await _firebaseMessaging.getToken();
      }
      debugPrint("++++Firebase Token: $fireToken");
      Boxes.putFireToken(fireToken);
      debugPrint("++++Firebase Token hive: ${Boxes.fireToken}");
    } catch (e) {
      debugPrint(e.toString());
    }
    initPushNotifications();
    await NotificationService.initLocalNotifications();
  }

//====================================================================
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // await Future.delayed(Duration(seconds: 2));
    await initNotifications();
  }
}
