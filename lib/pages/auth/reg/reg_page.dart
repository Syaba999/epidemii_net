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
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: S.of(context).email),
                    validator: ValidateHelper.validateMail,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: S.of(context).firstName),
                    validator: ValidateHelper.notNullValidator,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: S.of(context).lastName),
                    validator: ValidateHelper.notNullValidator,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: S.of(context).middleName),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: S.of(context).phone, hintText: "+7"),
                    inputFormatters: [_maskFormatter],
                    validator: ValidateHelper.validatePhone,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: S.of(context).address),
                    validator: ValidateHelper.notNullValidator,
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: state.onChangePassword,
                    decoration:
                        InputDecoration(labelText: S.of(context).password),
                    validator: ValidateHelper.validatePassword,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: S.of(context).confirmPassword),
                    validator: state.validatePasswordConfirm,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        state.signUpPress();
                      }
                    },
                    child: Text(S.of(context).registration),
                  ),
                  FlatButton(
                    onPressed: state.signInPress,
                    child: Text(S.of(context).login),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
