import 'package:email_validator/email_validator.dart';
import 'package:epidemiinet/generated/l10n.dart';

abstract class ValidateHelper {
  static String validateMail(String value) {
    if (EmailValidator.validate(value)) {
      final domain = value.split('@')[1];
      final domainSplit = domain.split('.');
      final domainName =
          Uri.parse(domainSplit.getRange(0, domainSplit.length - 1).join())
              .toString();
      final firstLevelDomain = Uri.parse(domainSplit.last).toString();
      if (domainName.length > 255) return S.current.domainMaxLengthError;
      if (firstLevelDomain.length > 63) return S.current.domainMaxLengthError;
      return null;
    }
    return EmailValidator.validate(value) ? null : S.current.mailValidatorText;
  }

  static String validatePassword(String value) {
    return value.length > 5 ? null : S.current.passMinLength(6);
  }

  static String notNullValidator(String value) {
    return value != null && value.length > 0 ? null : S.current.cantBeEmpty;
  }

  static String validatePasswordConfirm(
      String password, String confirmPassword) {
    return confirmPassword == password
        ? null
        : S.current.passConfirmValidatorText;
  }

  static String validatePhone(String value) {
    print(value.length);
    return value.length < 18 ? S.current.phoneValidatorText : null;
  }
}
