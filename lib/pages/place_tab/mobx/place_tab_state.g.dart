// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_tab_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaceTabState on _PlaceTabState, Store {
  final _$listTypeAtom = Atom(name: '_PlaceTabState.listType');

  @override
  ListType get listType {
    _$listTypeAtom.reportRead();
    return super.listType;
  }

  @override
  set listType(ListType value) {
    _$listTypeAtom.reportWrite(value, super.listType, () {
      super.listType = value;
    });
  }

  final _$_PlaceTabStateActionController =
      ActionController(name: '_PlaceTabState');

  @override
  void toggleListType() {
    final _$actionInfo = _$_PlaceTabStateActionController.startAction(
        name: '_PlaceTabState.toggleListType');
    try {
      return super.toggleListType();
    } finally {
      _$_PlaceTabStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listType: ${listType}
    ''';
  }
}
