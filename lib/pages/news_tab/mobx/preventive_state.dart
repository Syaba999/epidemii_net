import 'package:epidemiinet/api/requests.dart';
import 'package:epidemiinet/models/html_page.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'preventive_state.g.dart';

class PreventiveState = _PreventiveState with _$PreventiveState;

abstract class _PreventiveState extends MobxBase with Store {
  List<HtmlPage> pages;

  @observable
  List<bool> opened;

  @action
  void togglePage(int index) {
    final opened = List<bool>.from(this.opened);
    opened[index] = !opened[index];
    this.opened = opened;
  }

  @action
  Future<void> fetchPages() async {
    pages = await ApiRequests.getPages();
    opened = pages.map((e) => false).toList();
  }

  @override
  void dispose() {}
}
