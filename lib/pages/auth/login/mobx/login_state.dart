import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState extends MobxBase with Store {
  final _navigator = Injector.getInjector.get<NavigationService>().navigator;

  void signUpPress() {
    _navigator.pushNamed(regPageRoute);
  }

  void signInPress() {}

  @override
  void dispose() {}
}
