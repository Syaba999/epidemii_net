import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/pages/auth/login/login_page.dart';
import 'package:epidemiinet/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(
            builder: (_) => Injector.getInjector.get<HomePage>());
      case loginPageRoute:
        return MaterialPageRoute(
            builder: (_) => Injector.getInjector.get<LoginPage>());
      default:
        return MaterialPageRoute(
            builder: (_) => Injector.getInjector.get<HomePage>());
    }
  }
}
