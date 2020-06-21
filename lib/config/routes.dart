import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/pages/auth/login/login_page.dart';
import 'package:epidemiinet/pages/auth/reg/reg_page.dart';
import 'package:epidemiinet/pages/home/home_page.dart';
import 'package:epidemiinet/pages/news_tab/news_page.dart';
import 'package:epidemiinet/pages/news_tab/preventive_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case loginPageRoute:
        return CupertinoPageRoute(builder: (_) => LoginPage());
      case regPageRoute:
        return CupertinoPageRoute(builder: (_) => RegPage());
      case newsPageRoute:
        return CupertinoPageRoute(builder: (_) => NewsPage());
      case preventivePageRoute:
        return CupertinoPageRoute(builder: (_) => PreventivePage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
