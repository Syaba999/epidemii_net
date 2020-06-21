import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/helpers/validate_helper.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'reg_state.g.dart';

class RegState = _RegState with _$RegState;

abstract class _RegState extends MobxBase with Store {
  final _navigator = Injector.getInjector.get<NavigationService>().navigator;

  @observable
  bool isMailReal = true;

  String _password = '';

  void onChangePassword(String value) {
    _password = value;
  }

  String validatePasswordConfirm(String value) {
    return ValidateHelper.validatePasswordConfirm(_password, value);
  }

  void signUpPress() {}

  void signInPress() {
    _navigator.pop();
  }

  @override
  void dispose() {}
}
