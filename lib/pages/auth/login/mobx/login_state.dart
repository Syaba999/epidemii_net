import 'package:epidemiinet/api/requests.dart';
import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/data/persistent/persistent_data_source.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:epidemiinet/state/global_state.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState extends MobxBase with Store {
  final _navigator = Injector.getInjector.get<NavigationService>().navigator;

  void signUpPress() {
    _navigator.pushNamed(regPageRoute);
  }

  String email;
  String password;

  List<String> errors;

  void emailChanged(String value) {
    email = value;
  }

  void passwordChanged(String value) {
    password = value;
  }

  void signInPress() async {
    toLoadingState();
    final user = await ApiRequests.login(email, password).catchError((e) {
      errors = e;
      toErrorState();
    });
    if (user != null) {
      Injector.getInjector.get<GlobalState>().user = user;
      Injector.getInjector.get<PersistentDataSource>().setUser(user);
      _navigator.popAndPushNamed(homePageRoute);
    }
  }

  @override
  void dispose() {}
}
