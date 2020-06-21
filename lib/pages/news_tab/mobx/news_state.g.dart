// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsState on _NewsState, Store {
  final _$newsListAtom = Atom(name: '_NewsState.newsList');

  @override
  List<News> get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(List<News> value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  final _$fetchNewsListAsyncAction = AsyncAction('_NewsState.fetchNewsList');

  @override
  Future<void> fetchNewsList() {
    return _$fetchNewsListAsyncAction.run(() => super.fetchNewsList());
  }

  @override
  String toString() {
    return '''
newsList: ${newsList}
    ''';
  }
}
