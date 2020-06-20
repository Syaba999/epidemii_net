import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'home_state.g.dart';

class HomeState = _HomeState with _$HomeState;

abstract class _HomeState extends MobxBase with Store {
  @observable
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  @action
  void selectTab(int index) => _selectedTab = index;

  @override
  void dispose() {}
}
