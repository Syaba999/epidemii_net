import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/helpers/validate_helper.dart';
import 'package:epidemiinet/pages/auth/reg/mobx/reg_state.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx_provider/mobx_provider.dart';

class RegPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return MobxStatelessObserver(
      store: RegState(),
      builder: _content,
    );
  }

  Widget _content(BuildContext context, RegState state) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
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
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: S.of(context).email),
                validator: ValidateHelper.validateMail,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: S.of(context).firstName),
                validator: ValidateHelper.notNullValidator,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: S.of(context).lastName),
                validator: ValidateHelper.notNullValidator,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: S.of(context).middleName),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: S.of(context).phone,
                ),
                inputFormatters: [_maskFormatter],
                validator: ValidateHelper.validatePhone,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: S.of(context).address),
                validator: ValidateHelper.notNullValidator,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: state.onChangePassword,
                decoration: InputDecoration(hintText: S.of(context).password),
                validator: ValidateHelper.validatePassword,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration:
                    InputDecoration(hintText: S.of(context).confirmPassword),
                validator: state.validatePasswordConfirm,
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      state.signUpPress();
                    }
                  },
                  child: Text(S.of(context).registration),
                ),
              ),
              FlatButton(
                onPressed: state.signInPress,
                child: Text(S.of(context).login),
              )
            ],
          ),
        ),
      ),
    );
  }
}
