// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegState on _RegState, Store {
  final _$isMailRealAtom = Atom(name: '_RegState.isMailReal');

  @override
  bool get isMailReal {
    _$isMailRealAtom.reportRead();
    return super.isMailReal;
  }

  @override
  set isMailReal(bool value) {
    _$isMailRealAtom.reportWrite(value, super.isMailReal, () {
      super.isMailReal = value;
    });
  }

  @override
  String toString() {
    return '''
isMailReal: ${isMailReal}
    ''';
  }
}
