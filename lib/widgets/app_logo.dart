import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/images/logo.png"),
        SizedBox(
          height: 32,
        ),
        Text(
          "ЭПИДЕМИИ-НЕТ.РФ",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
