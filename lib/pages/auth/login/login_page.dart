import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/helpers/validate_helper.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: S.of(context).email,
                ),
                validator: ValidateHelper.validateMail,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: S.of(context).password,
                ),
                validator: ValidateHelper.validatePassword,
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        state.signInPress();
                      }
                    },
                    child: Text(S.of(context).login),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: state.signUpPress,
                    child: Text(S.of(context).registration),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
