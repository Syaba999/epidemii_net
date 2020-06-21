import 'package:epidemiinet/api/requests.dart';
import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/data/persistent/persistent_data_source.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/helpers/validate_helper.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:epidemiinet/state/global_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'reg_state.g.dart';

class RegState = _RegState with _$RegState;

abstract class _RegState extends MobxBase with Store {
  final _navigator = Injector.getInjector.get<NavigationService>().navigator;

  @observable
  bool isMailReal = true;

  List<String> errors = List();

  String _password = '';
  String _passwordConfirm = '';
  String _email = '';
  String _firstName = '';
  String _lastName = '';
  String _middleName = '';
  String _phone = '';
  String _address = '';

  void onChangePassword(String value) {
    _password = value;
  }

  void onChangePasswordConf(String value) {
    _passwordConfirm = value;
  }

  void onChangeEmail(String value) {
    _email = value;
  }

  void onChangeFirstName(String value) {
    _firstName = value;
  }

  void onChangeLastName(String value) {
    _lastName = value;
  }

  void onChangeMiddleName(String value) {
    _middleName = value;
  }

  void onChangePhone(String value) {
    _phone = value;
  }

  void onChangeAddress(String value) {
    _address = value;
  }

  String validatePasswordConfirm(String value) {
    return ValidateHelper.validatePasswordConfirm(_password, value);
  }

  void signUpPress() async {
    toLoadingState();
    final user = await ApiRequests.signUp(_email, _password, _passwordConfirm,
            _firstName, _lastName, _phone, _address, _middleName)
        .catchError((e) {
      errors = e;
      toErrorState();
    });
    if (user != null) {
      Injector.getInjector.get<GlobalState>().user = user;
      Injector.getInjector.get<PersistentDataSource>().setUser(user);
      _navigator.pushNamedAndRemoveUntil(
          homePageRoute, (Route<dynamic> route) => false);
    }
  }

  void signInPress() {
    _navigator.pop();
  }

  @override
  void dispose() {}
}
