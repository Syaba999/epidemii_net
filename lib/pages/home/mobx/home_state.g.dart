// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on _HomeState, Store {
  final _$_selectedTabAtom = Atom(name: '_HomeState._selectedTab');

  @override
  int get _selectedTab {
    _$_selectedTabAtom.reportRead();
    return super._selectedTab;
  }

  @override
  set _selectedTab(int value) {
    _$_selectedTabAtom.reportWrite(value, super._selectedTab, () {
      super._selectedTab = value;
    });
  }

  final _$_HomeStateActionController = ActionController(name: '_HomeState');

  @override
  void selectTab(int index) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.selectTab');
    try {
      return super.selectTab(index);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
