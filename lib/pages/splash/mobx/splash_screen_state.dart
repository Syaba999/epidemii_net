import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/data/persistent/persistent_data_source.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

import '../../../config/routes_val.dart';

part 'splash_screen_state.g.dart';

class SplashScreenState = _SplashScreenState with _$SplashScreenState;

abstract class _SplashScreenState extends MobxBase with Store {
  void init(GlobalKey<NavigatorState> navigatorKey) {
    Future.wait([
      Future.delayed(Duration(seconds: 3)),
      _initApp(navigatorKey),
    ]).then((value) => _allReady());
  }

  Future<void> _initApp(GlobalKey<NavigatorState> navigatorKey) async {
    Injector.initDI(navigatorKey);
    await Injector.getInjector.allReady();
  }

  void _allReady() {
    final prefs = Injector.getInjector.get<PersistentDataSource>();
    final navigator = Injector.getInjector.get<NavigationService>().navigator;
    navigator.popAndPushNamed(homePageRoute);
    if (prefs.getUser() == null) {
      //navigator.popAndPushNamed(loginPageRoute);
    } else {
      //navigator.popAndPushNamed(homePageRoute);
    }
  }

  @override
  void dispose() {}
}
