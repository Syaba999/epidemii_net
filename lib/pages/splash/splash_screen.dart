import 'package:epidemiinet/pages/splash/mobx/splash_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      body: Center(
        child: SpinKitRotatingPlain(
          color: Theme.of(context).accentColor,
          size: 50.0,
        ),
      ),
    );
  }
}
