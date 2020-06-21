import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/models/notice.dart';
import 'package:epidemiinet/state/global_state.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'notify_state.g.dart';

class NotifyState = _NotifyState with _$NotifyState;

abstract class _NotifyState extends MobxBase with Store {
  List<Notice> noticeList =
      Injector.getInjector.get<GlobalState>().user.notices;

  @override
  void dispose() {}
}
