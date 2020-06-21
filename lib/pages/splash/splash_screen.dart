import 'package:epidemiinet/pages/splash/mobx/splash_screen_state.dart';
import 'package:epidemiinet/widgets/app_logo.dart';
import 'package:epidemiinet/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class SplashScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const SplashScreen({Key key, @required this.navigatorKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver(
      store: SplashScreenState(),
      initFunction: (SplashScreenState store) => store.init(navigatorKey),
      builder: _content,
    );
  }

  Widget _content(BuildContext context, SplashScreenState store) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppLogo(),
          Loader(),
        ],
      ),
    );
  }
}
