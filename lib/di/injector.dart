import 'package:epidemiinet/api/api_auth_client.dart';
import 'package:epidemiinet/api/api_client.dart';
import 'package:epidemiinet/data/persistent/persistent_data_source.dart';
import 'package:epidemiinet/pages/home/mobx/home_state.dart';
import 'package:epidemiinet/pages/news_tab/mobx/news_state.dart';
import 'package:epidemiinet/pages/place_tab/mobx/place_tab_state.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:epidemiinet/state/global_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final _injector = GetIt.instance;

  static GetIt get getInjector => _injector;

  static void initDI(GlobalKey<NavigatorState> navigatorKey) {
    _injector.registerLazySingleton(() => NavigationService(navigatorKey));
    _injector.registerSingletonAsync(
        () async => await PersistentDataSource.create());
    _injector.registerLazySingleton(() => ApiClient.init());
    _injector.registerLazySingleton(() => ApiAuthClient.init());
    _registerSingletonStates();
  }

  static void _registerSingletonStates() {
    _injector.registerLazySingleton(() => GlobalState());
    _injector.registerLazySingleton(() => NewsState());
    _injector.registerLazySingleton(() => PlaceTabState());
    _injector.registerLazySingleton(() => HomeState());
  }
}
