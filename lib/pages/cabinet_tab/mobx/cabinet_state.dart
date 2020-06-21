import 'package:epidemiinet/api/requests.dart';
import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/models/user.dart';
import 'package:epidemiinet/models/vaccination_calendar.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'cabinet_state.g.dart';

class CabinetState = _CabinetState with _$CabinetState;

abstract class _CabinetState extends MobxBase with Store {
  final _navigator = Injector.getInjector.get<NavigationService>().navigator;

  @observable
  List<VaccinationCalendar> calendarList;

  User user;

  void onCalendarTap() {
    _navigator.pushNamed(preventivePageRoute);
  }

  @action
  Future<void> fetchCalendarList() async {
    user = await ApiRequests.getUserInfo(15);
    calendarList = await ApiRequests.getVaccinationCalendarList();
  }

  void logout() {
    _navigator.popAndPushNamed(loginPageRoute);
  }

  @override
  void dispose() {}
}
