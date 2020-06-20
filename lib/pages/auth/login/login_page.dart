import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/pages/auth/login/mobx/login_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MobxStatelessObserver(
      store: LoginState(),
      builder: _content,
    );
  }

  Widget _content(BuildContext context, LoginState state) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: S.of(context).email),
                validator: state.validateMail,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: S.of(context).password),
                validator: state.validatePassword,
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
                child: Text(S.of(context).login),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(S.of(context).registration),
              )
            ],
          ),
        ),
      ),
    );
  }
}
