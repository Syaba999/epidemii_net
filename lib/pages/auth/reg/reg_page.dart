import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/helpers/validate_helper.dart';
import 'package:epidemiinet/pages/auth/reg/mobx/reg_state.dart';
import 'package:epidemiinet/widgets/app_logo.dart';
import 'package:epidemiinet/widgets/loader.dart';
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
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      if (!state.isMailReal) {
        _formKey.currentState.validate();
      }
    });
    return Scaffold(
      body: (state.isLoading)
          ? Loader()
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32,
                    ),
                    AppLogo(),
                    if (state.isError)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: state.errors
                              .map((e) => Text(
                                    e,
                                    style: TextStyle(color: Colors.red),
                                  ))
                              .toList(),
                        ),
                      ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: state.onChangeEmail,
                      decoration:
                          InputDecoration(hintText: S.of(context).email),
                      validator: (value) => ValidateHelper.validateMail(value,
                          isMailReal: state.isMailReal),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      onChanged: state.onChangeFirstName,
                      decoration:
                          InputDecoration(hintText: S.of(context).firstName),
                      validator: ValidateHelper.notNullValidator,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      onChanged: state.onChangeLastName,
                      decoration:
                          InputDecoration(hintText: S.of(context).lastName),
                      validator: ValidateHelper.notNullValidator,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      onChanged: state.onChangeMiddleName,
                      decoration:
                          InputDecoration(hintText: S.of(context).middleName),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      onChanged: state.onChangePhone,
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
                      onChanged: state.onChangeAddress,
                      decoration:
                          InputDecoration(hintText: S.of(context).address),
                      validator: ValidateHelper.notNullValidator,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: state.onChangePassword,
                      decoration:
                          InputDecoration(hintText: S.of(context).password),
                      validator: ValidateHelper.validatePassword,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: state.onChangePasswordConf,
                      decoration: InputDecoration(
                          hintText: S.of(context).confirmPassword),
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
