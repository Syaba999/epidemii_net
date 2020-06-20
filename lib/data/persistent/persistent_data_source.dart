import 'dart:convert';

import 'package:epidemiinet/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentDataSource {
  static SharedPreferences _localStorage;
  PersistentDataSource._internal();

  static Future<PersistentDataSource> create() async {
    _localStorage = await SharedPreferences.getInstance();
    return PersistentDataSource._internal();
  }

  String _kUser = "USER";

  User getUser() {
    final userString = _localStorage.getString(_kUser);
    if (userString == null) {
      return null;
    }
    return User.fromJson(jsonDecode(userString));
  }

  void saveUser(User user) {
    _localStorage.setString(_kUser, jsonEncode(user));
  }
}
