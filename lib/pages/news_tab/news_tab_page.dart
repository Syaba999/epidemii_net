import 'package:flutter/material.dart';

class NewsTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Новости"),
      ),
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
