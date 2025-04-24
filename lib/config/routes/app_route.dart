import 'package:flutter/material.dart';
import 'package:otp_sms_sender/presentation/features/home/home_page.dart';
import 'package:otp_sms_sender/presentation/features/home/send_sms_page.dart';
import 'package:otp_sms_sender/presentation/features/home/sim_card_edit_page.dart';
import 'package:otp_sms_sender/presentation/public/pages/logo_page.dart';
import 'package:otp_sms_sender/presentation/public/pages/page_404.dart';

import 'go_to.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> mainNavKey = GlobalKey();
  static final context = mainNavKey.currentContext!;
  //====================================
  static MaterialPageRoute _pageRout(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
  //====================================

  static Route onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments as Map?;
    switch (routeSettings.name) {
      case Go.logo:
        return _pageRout(const LogoPage());
      case Go.home:
        return _pageRout(const HomePage());
      case Go.simCardEdit:
        return _pageRout(SimCardEditPage(
          sender: args?['sender'],
        ));
      case Go.sendSms:
        return _pageRout(const SendSmsPage());

      default:
        return _pageRout(const Page404());
    }
  }
}
