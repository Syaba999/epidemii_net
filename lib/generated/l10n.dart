// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Вход`
  String get login {
    return Intl.message(
      'Вход',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Электронная почта`
  String get email {
    return Intl.message(
      'Электронная почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get registration {
    return Intl.message(
      'Регистрация',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Введите корректный адрес электронной почты`
  String get mailValidatorText {
    return Intl.message(
      'Введите корректный адрес электронной почты',
      name: 'mailValidatorText',
      desc: '',
      args: [],
    );
  }

  /// `не менее {count} символов`
  String passMinLength(Object count) {
    return Intl.message(
      'не менее $count символов',
      name: 'passMinLength',
      desc: '',
      args: [count],
    );
  }

  /// `пароли не совпадают`
  String get passConfirmValidatorText {
    return Intl.message(
      'пароли не совпадают',
      name: 'passConfirmValidatorText',
      desc: '',
      args: [],
    );
  }

  /// `Повторите пароль`
  String get confirmPassword {
    return Intl.message(
      'Повторите пароль',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `не может быть пустым`
  String get cantBeEmpty {
    return Intl.message(
      'не может быть пустым',
      name: 'cantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get firstName {
    return Intl.message(
      'Имя',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get lastName {
    return Intl.message(
      'Фамилия',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Отчество`
  String get middleName {
    return Intl.message(
      'Отчество',
      name: 'middleName',
      desc: '',
      args: [],
    );
  }

  /// `Телефон`
  String get phone {
    return Intl.message(
      'Телефон',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Адрес`
  String get address {
    return Intl.message(
      'Адрес',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `доменное имя не может быть длинне 255 символов`
  String get domainMaxLengthError {
    return Intl.message(
      'доменное имя не может быть длинне 255 символов',
      name: 'domainMaxLengthError',
      desc: '',
      args: [],
    );
  }

  /// `введите номер телефона польностью`
  String get phoneValidatorText {
    return Intl.message(
      'введите номер телефона польностью',
      name: 'phoneValidatorText',
      desc: '',
      args: [],
    );
  }

  /// `Меры профилактики`
  String get preventiveMeasures {
    return Intl.message(
      'Меры профилактики',
      name: 'preventiveMeasures',
      desc: '',
      args: [],
    );
  }

  /// `Новости`
  String get newsList {
    return Intl.message(
      'Новости',
      name: 'newsList',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Карта`
  String get map {
    return Intl.message(
      'Карта',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Кабинет`
  String get cabinet {
    return Intl.message(
      'Кабинет',
      name: 'cabinet',
      desc: '',
      args: [],
    );
  }

  /// `Вакцинация`
  String get vaccination {
    return Intl.message(
      'Вакцинация',
      name: 'vaccination',
      desc: '',
      args: [],
    );
  }

  /// `Места вакцинации`
  String get vaccinationPlaces {
    return Intl.message(
      'Места вакцинации',
      name: 'vaccinationPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Списком`
  String get asList {
    return Intl.message(
      'Списком',
      name: 'asList',
      desc: '',
      args: [],
    );
  }

  /// `На карте`
  String get onMap {
    return Intl.message(
      'На карте',
      name: 'onMap',
      desc: '',
      args: [],
    );
  }

  /// `Время работы`
  String get workTime {
    return Intl.message(
      'Время работы',
      name: 'workTime',
      desc: '',
      args: [],
    );
  }

  /// `Сайт`
  String get site {
    return Intl.message(
      'Сайт',
      name: 'site',
      desc: '',
      args: [],
    );
  }

  /// `домена электронной почты не существует`
  String get domainNotReal {
    return Intl.message(
      'домена электронной почты не существует',
      name: 'domainNotReal',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}