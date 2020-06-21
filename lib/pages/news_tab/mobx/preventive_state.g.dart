// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preventive_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PreventiveState on _PreventiveState, Store {
  final _$openedAtom = Atom(name: '_PreventiveState.opened');

  @override
  List<bool> get opened {
    _$openedAtom.reportRead();
    return super.opened;
  }

  @override
  set opened(List<bool> value) {
    _$openedAtom.reportWrite(value, super.opened, () {
      super.opened = value;
    });
  }

  final _$fetchPagesAsyncAction = AsyncAction('_PreventiveState.fetchPages');

  @override
  Future<void> fetchPages() {
    return _$fetchPagesAsyncAction.run(() => super.fetchPages());
  }

  final _$_PreventiveStateActionController =
      ActionController(name: '_PreventiveState');

  @override
  void togglePage(int index) {
    final _$actionInfo = _$_PreventiveStateActionController.startAction(
        name: '_PreventiveState.togglePage');
    try {
      return super.togglePage(index);
    } finally {
      _$_PreventiveStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
opened: ${opened}
    ''';
  }
}
