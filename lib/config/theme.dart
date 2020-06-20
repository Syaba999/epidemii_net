import 'package:flutter/material.dart';

final _accentColor = Colors.cyan[600];
final ThemeData appTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: _accentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
      buttonColor: _accentColor,
      textTheme: ButtonTextTheme.primary,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.transparent)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(width: 2, color: _accentColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(width: 2, color: _accentColor)),
    ));

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
