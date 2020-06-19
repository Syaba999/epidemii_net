import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = homePageRoute;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
