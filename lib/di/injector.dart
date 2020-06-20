import 'package:epidemiinet/data/persistent/persistent_data_source.dart';
import 'package:epidemiinet/pages/auth/login/login_page.dart';
import 'package:epidemiinet/pages/home/home_page.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final _injector = GetIt.instance;

  static GetIt get getInjector => _injector;

  static void initDI(GlobalKey<NavigatorState> navigatorKey) {
    _registerPagesFactories();
    _injector.registerLazySingleton(() => NavigationService(navigatorKey));
    _injector.registerSingletonAsync(
        () async => await PersistentDataSource.create());
  }

  static void _registerPagesFactories() {
    _injector.registerFactory(() => HomePage());
    _injector.registerFactory(() => LoginPage());
  }
}
