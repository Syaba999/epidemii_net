import 'package:epidemiinet/api/requests.dart';
import 'package:epidemiinet/config/routes_val.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/models/news.dart';
import 'package:epidemiinet/services/navigation_service.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'news_state.g.dart';

class NewsState = _NewsState with _$NewsState;

abstract class _NewsState extends MobxBase with Store {
  final _navigator = Injector.getInjector.get<NavigationService>().navigator;
  @observable
  List<News> newsList;

  String _selectedNewsId;

  News get selectedNews =>
      newsList.firstWhere((element) => element.id == _selectedNewsId);

  void onNewsItemTap(String newsId) {
    _selectedNewsId = newsId;
    _navigator.pushNamed(newsPageRoute);
  }

  void preventiveButtonPressed() {
    _navigator.pushNamed(preventivePageRoute);
  }

  @action
  Future<void> fetchNewsList() async {
    newsList = await ApiRequests.getNewsList();
  }

  @override
  void dispose() {}
}
