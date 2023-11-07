import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_app/bottomNavigation/bottom_navigation.dart';
import 'package:step_app/dashboard/dashboard_screen_provider.dart';
import 'package:step_app/modules/intro/intro_screen.dart';
import 'package:step_app/modules/settings/howItWork/how_it_work_screen.dart';
import 'package:step_app/modules/settings/privacyPolicy/privacy_policy_screen.dart';
import 'package:step_app/modules/settings/setting/setting_screen.dart';
import 'package:step_app/modules/settings/termCondition/term_condition_screen.dart';
import 'package:step_app/routes/route_name.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.introScreen:
        return MaterialPageRoute(builder: (context) => const IntroScreen());

      case RouteName.bottomBarScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => DashBoardScreenProvider(),
                  child: const BottomNavigationWidget(),
                ));


      case RouteName.settingScreen:
        return MaterialPageRoute(builder: (context) => const SettingScreen());

      case RouteName.howItWorkScreen:
        return MaterialPageRoute(builder: (context) => const HowItWorkScreen());

      case RouteName.termConditionScreen:
        return MaterialPageRoute(
            builder: (context) => const TermConditionScreen());

      case RouteName.privacyPolicyScreen:
        return MaterialPageRoute(
            builder: (context) => const PrivacyPolicyScreen());








      default:
        return MaterialPageRoute(builder: (context) => const IntroScreen());
    }
  }
}
