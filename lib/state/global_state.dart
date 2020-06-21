import 'package:epidemiinet/models/user.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'global_state.g.dart';

class GlobalState = _GlobalState with _$GlobalState;

abstract class _GlobalState extends MobxBase with Store {
  User user;

  @override
  void dispose() {}
}
