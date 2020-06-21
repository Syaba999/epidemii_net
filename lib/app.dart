import 'package:epidemiinet/config/routes.dart';
import 'package:epidemiinet/config/theme.dart';
import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Эпидемии НЕТ',
      theme: appTheme,
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: Routes.generateRoute,
      home: SplashScreen(
        navigatorKey: _navigatorKey,
      ),
    );
  }
}
