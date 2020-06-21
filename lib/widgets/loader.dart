import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRotatingPlain(
        color: Theme.of(context).accentColor,
        size: 50.0,
      ),
    );
  }
}
