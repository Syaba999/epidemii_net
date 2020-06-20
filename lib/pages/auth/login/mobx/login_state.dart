import 'package:email_validator/email_validator.dart';
import 'package:epidemiinet/generated/l10n.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState extends MobxBase with Store {
  String validateMail(String value) {
    return EmailValidator.validate(value) ? null : S.current.mailValidatorText;
  }

  String validatePassword(String value) {
    return value.length > 5 ? null : S.current.passMinLength(6);
  }

  @override
  void dispose() {}
}
